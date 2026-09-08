// Command oauth is a GitHub OAuth proxy implementing the Decap CMS / Sveltia
// CMS "external OAuth client" protocol, so the CMS at /admin can sign in with
// GitHub without a hosted auth service.
//
// Flow:
//  1. The CMS opens a popup at /oauth/auth?provider=github&site_id=<host>&scope=repo.
//     We set a state cookie and redirect to GitHub's authorize page.
//  2. GitHub redirects the popup back to /oauth/callback?code=..&state=..
//     We check the state, exchange the code for a token and answer with a
//     small page that hands the token to the opener over postMessage.
//
// The token is never logged and never stored server-side.
package main

import (
	"context"
	"crypto/rand"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"
)

const (
	provider        = "github"
	stateCookieName = "oauth_state"
	stateTTL        = 10 * time.Minute
	defaultScope    = "repo,user"
)

var allowedScopes = map[string]bool{"repo": true, "public_repo": true, "user": true}

// config is everything the service reads from the environment.
type config struct {
	Listen         string
	PublicBaseURL  *url.URL
	AllowedOrigins []string // full origins, e.g. https://thomasjbarlow.com
	ClientID       string
	ClientSecret   string
}

func loadConfig() (*config, error) {
	cfg := &config{Listen: getenv("LISTEN", ":8081")}

	rawBase := strings.TrimRight(os.Getenv("PUBLIC_BASE_URL"), "/")
	if rawBase == "" {
		return nil, errors.New("PUBLIC_BASE_URL is required (e.g. https://thomasjbarlow.com)")
	}
	base, err := url.Parse(rawBase)
	if err != nil || base.Scheme == "" || base.Host == "" {
		return nil, fmt.Errorf("PUBLIC_BASE_URL %q is not an absolute URL", rawBase)
	}
	cfg.PublicBaseURL = base

	for _, o := range strings.Split(os.Getenv("ALLOWED_ORIGINS"), ",") {
		o = strings.TrimRight(strings.TrimSpace(o), "/")
		if o == "" {
			continue
		}
		u, err := url.Parse(o)
		if err != nil || u.Scheme == "" || u.Host == "" || u.Path != "" {
			return nil, fmt.Errorf("ALLOWED_ORIGINS entry %q is not an origin (scheme://host[:port])", o)
		}
		cfg.AllowedOrigins = append(cfg.AllowedOrigins, o)
	}
	if len(cfg.AllowedOrigins) == 0 {
		return nil, errors.New("ALLOWED_ORIGINS is required (comma separated, e.g. https://thomasjbarlow.com)")
	}

	secrets := map[string]string{}
	secretsFile := getenv("OAUTH_SECRETS_FILE", "/run/secrets/oauth_secrets")
	if f, err := os.Open(secretsFile); err == nil {
		secrets, err = parseKeyValueFile(f)
		f.Close()
		if err != nil {
			return nil, fmt.Errorf("reading %s: %w", secretsFile, err)
		}
	} else if !errors.Is(err, os.ErrNotExist) {
		return nil, fmt.Errorf("opening %s: %w", secretsFile, err)
	}
	cfg.ClientID = firstNonEmpty(secrets["GITHUB_CLIENT_ID"], os.Getenv("GITHUB_CLIENT_ID"))
	cfg.ClientSecret = firstNonEmpty(secrets["GITHUB_CLIENT_SECRET"], os.Getenv("GITHUB_CLIENT_SECRET"))
	if cfg.ClientID == "" || cfg.ClientSecret == "" {
		return nil, fmt.Errorf("GITHUB_CLIENT_ID and GITHUB_CLIENT_SECRET are required (from %s or the environment)", secretsFile)
	}
	return cfg, nil
}

// parseKeyValueFile reads KEY=VALUE lines. Blank lines and lines starting
// with # are ignored; CRLF endings and surrounding quotes are tolerated.
func parseKeyValueFile(r io.Reader) (map[string]string, error) {
	data, err := io.ReadAll(r)
	if err != nil {
		return nil, err
	}
	out := map[string]string{}
	for i, line := range strings.Split(string(data), "\n") {
		line = strings.TrimSpace(strings.TrimSuffix(line, "\r"))
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		key, value, ok := strings.Cut(line, "=")
		if !ok {
			return nil, fmt.Errorf("line %d: expected KEY=VALUE", i+1)
		}
		key = strings.TrimSpace(key)
		value = strings.TrimSpace(value)
		if len(value) >= 2 && (value[0] == '"' || value[0] == '\'') && value[len(value)-1] == value[0] {
			value = value[1 : len(value)-1]
		}
		if key == "" {
			return nil, fmt.Errorf("line %d: empty key", i+1)
		}
		out[key] = value
	}
	return out, nil
}

// server holds the handlers. The GitHub URLs are fields so tests can point
// them at an httptest server.
type server struct {
	cfg                *config
	githubAuthorizeURL string
	githubTokenURL     string
	client             *http.Client
}

func newServer(cfg *config) *server {
	return &server{
		cfg:                cfg,
		githubAuthorizeURL: "https://github.com/login/oauth/authorize",
		githubTokenURL:     "https://github.com/login/oauth/access_token",
		client:             &http.Client{Timeout: 10 * time.Second},
	}
}

func (s *server) handler() http.Handler {
	mux := http.NewServeMux()
	mux.HandleFunc("GET /oauth/auth", s.handleAuth)
	mux.HandleFunc("GET /oauth/callback", s.handleCallback)
	mux.HandleFunc("GET /oauth/health", func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "text/plain; charset=utf-8")
		io.WriteString(w, "ok")
	})
	return noStore(mux)
}

func noStore(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Cache-Control", "no-store")
		w.Header().Set("X-Content-Type-Options", "nosniff")
		w.Header().Set("Referrer-Policy", "no-referrer")
		next.ServeHTTP(w, r)
	})
}

func (s *server) redirectURI() string {
	return s.cfg.PublicBaseURL.String() + "/oauth/callback"
}

// siteAllowed reports whether the CMS host from site_id belongs to one of
// the allowed origins. Decap/Sveltia send location.host (host[:port]).
func (s *server) siteAllowed(siteID string) bool {
	siteID = strings.ToLower(strings.TrimSpace(siteID))
	if siteID == "" {
		return false
	}
	for _, o := range s.cfg.AllowedOrigins {
		u, err := url.Parse(o)
		if err != nil {
			continue
		}
		if strings.EqualFold(u.Host, siteID) || strings.EqualFold(u.Hostname(), siteID) {
			return true
		}
	}
	return false
}

func (s *server) originAllowed(origin string) bool {
	for _, o := range s.cfg.AllowedOrigins {
		if strings.EqualFold(o, origin) {
			return true
		}
	}
	return false
}

func (s *server) handleAuth(w http.ResponseWriter, r *http.Request) {
	q := r.URL.Query()
	if q.Get("provider") != provider {
		http.Error(w, "unsupported provider", http.StatusBadRequest)
		return
	}
	if !s.siteAllowed(q.Get("site_id")) {
		http.Error(w, "site_id is not an allowed site", http.StatusForbidden)
		return
	}
	scope := q.Get("scope")
	if scope == "" {
		scope = defaultScope
	}
	var scopes []string
	for _, sc := range strings.FieldsFunc(scope, func(c rune) bool { return c == ',' || c == ' ' }) {
		if !allowedScopes[sc] {
			http.Error(w, "unsupported scope", http.StatusBadRequest)
			return
		}
		scopes = append(scopes, sc)
	}

	state, err := randomToken()
	if err != nil {
		http.Error(w, "could not generate state", http.StatusInternalServerError)
		return
	}
	http.SetCookie(w, &http.Cookie{
		Name:     stateCookieName,
		Value:    state,
		Path:     "/oauth/",
		MaxAge:   int(stateTTL.Seconds()),
		HttpOnly: true,
		Secure:   s.cfg.PublicBaseURL.Scheme == "https",
		SameSite: http.SameSiteLaxMode,
	})

	params := url.Values{
		"client_id":    {s.cfg.ClientID},
		"redirect_uri": {s.redirectURI()},
		"scope":        {strings.Join(scopes, " ")},
		"state":        {state},
	}
	http.Redirect(w, r, s.githubAuthorizeURL+"?"+params.Encode(), http.StatusFound)
}

func (s *server) handleCallback(w http.ResponseWriter, r *http.Request) {
	q := r.URL.Query()

	// Clear the state cookie whatever happens: a state is single use.
	http.SetCookie(w, &http.Cookie{Name: stateCookieName, Value: "", Path: "/oauth/", MaxAge: -1, HttpOnly: true})

	cookie, err := r.Cookie(stateCookieName)
	state := q.Get("state")
	if err != nil || state == "" || cookie.Value != state {
		log.Printf("callback: state mismatch from %s", r.RemoteAddr)
		s.writeResult(w, http.StatusBadRequest, "error", map[string]string{"error": "invalid or expired OAuth state; please try signing in again"})
		return
	}
	if ghErr := q.Get("error"); ghErr != "" {
		log.Printf("callback: github returned error %q", ghErr)
		s.writeResult(w, http.StatusBadRequest, "error", map[string]string{"error": firstNonEmpty(q.Get("error_description"), ghErr)})
		return
	}
	code := q.Get("code")
	if code == "" {
		s.writeResult(w, http.StatusBadRequest, "error", map[string]string{"error": "missing code"})
		return
	}

	token, err := s.exchangeCode(r.Context(), code)
	if err != nil {
		log.Printf("callback: token exchange failed: %v", err)
		s.writeResult(w, http.StatusBadGateway, "error", map[string]string{"error": "token exchange with GitHub failed"})
		return
	}
	log.Printf("callback: sign-in completed for %s", r.RemoteAddr)
	s.writeResult(w, http.StatusOK, "success", map[string]string{"token": token, "provider": provider})
}

func (s *server) exchangeCode(ctx context.Context, code string) (string, error) {
	body, err := json.Marshal(map[string]string{
		"client_id":     s.cfg.ClientID,
		"client_secret": s.cfg.ClientSecret,
		"code":          code,
		"redirect_uri":  s.redirectURI(),
	})
	if err != nil {
		return "", err
	}
	req, err := http.NewRequestWithContext(ctx, http.MethodPost, s.githubTokenURL, strings.NewReader(string(body)))
	if err != nil {
		return "", err
	}
	req.Header.Set("Accept", "application/json")
	req.Header.Set("Content-Type", "application/json")
	resp, err := s.client.Do(req)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return "", fmt.Errorf("github responded %s", resp.Status)
	}
	var result struct {
		AccessToken      string `json:"access_token"`
		Error            string `json:"error"`
		ErrorDescription string `json:"error_description"`
	}
	if err := json.NewDecoder(io.LimitReader(resp.Body, 1<<16)).Decode(&result); err != nil {
		return "", fmt.Errorf("decoding github response: %w", err)
	}
	if result.Error != "" {
		return "", fmt.Errorf("github: %s", firstNonEmpty(result.ErrorDescription, result.Error))
	}
	if result.AccessToken == "" {
		return "", errors.New("github response had no access_token")
	}
	return result.AccessToken, nil
}

// writeResult renders the popup page that completes the handshake with the
// CMS window. status is "success" or "error"; content is JSON-serialised
// into the message.
func (s *server) writeResult(w http.ResponseWriter, code int, status string, content map[string]string) {
	nonce, err := randomToken()
	if err != nil {
		http.Error(w, "could not generate nonce", http.StatusInternalServerError)
		return
	}
	// json.Marshal escapes <, > and & as \u00XX, so the values are safe to
	// embed inside a <script> element.
	contentJSON, _ := json.Marshal(content)
	originsJSON, _ := json.Marshal(s.cfg.AllowedOrigins)

	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	w.Header().Set("Content-Security-Policy",
		"default-src 'none'; script-src 'nonce-"+nonce+"'; base-uri 'none'; form-action 'none'; frame-ancestors 'none'")
	w.WriteHeader(code)
	fmt.Fprintf(w, callbackHTML, nonce, originsJSON, provider, status, contentJSON)
}

// The opener (the CMS) listens for "authorizing:<provider>" and answers by
// posting the same string back; only then do we hand over the result, and
// only to an allowed origin. This matches Decap CMS and Sveltia CMS.
const callbackHTML = `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><title>Signing in…</title></head>
<body><p>Completing sign-in… you can close this window if it does not close by itself.</p>
<script nonce="%s">
(() => {
  const allowedOrigins = %s;
  const provider = %q;
  const status = %q;
  const content = %s;
  const reply = (origin) => {
    if (status === "success" && !allowedOrigins.includes(origin)) return;
    window.opener.postMessage("authorization:" + provider + ":" + status + ":" + JSON.stringify(content), origin);
    setTimeout(() => window.close(), 250);
  };
  if (!window.opener) {
    document.body.textContent = status === "success"
      ? "Signed in, but this window was not opened by the CMS. Please close it and try again from /admin."
      : "Sign-in failed: " + (content.error || "unknown error");
    return;
  }
  window.addEventListener("message", (e) => {
    if (e.data !== "authorizing:" + provider) return;
    reply(e.origin);
  }, { once: true });
  window.opener.postMessage("authorizing:" + provider, "*");
})();
</script></body></html>
`

func randomToken() (string, error) {
	b := make([]byte, 16)
	if _, err := rand.Read(b); err != nil {
		return "", err
	}
	return hex.EncodeToString(b), nil
}

func getenv(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}

func firstNonEmpty(values ...string) string {
	for _, v := range values {
		if v != "" {
			return v
		}
	}
	return ""
}

func main() {
	log.SetFlags(log.LstdFlags | log.LUTC)
	cfg, err := loadConfig()
	if err != nil {
		log.Fatalf("config: %v", err)
	}
	srv := &http.Server{
		Addr:              cfg.Listen,
		Handler:           newServer(cfg).handler(),
		ReadHeaderTimeout: 5 * time.Second,
		ReadTimeout:       10 * time.Second,
		WriteTimeout:      15 * time.Second,
		IdleTimeout:       60 * time.Second,
	}

	ctx, stop := signal.NotifyContext(context.Background(), syscall.SIGINT, syscall.SIGTERM)
	defer stop()

	errCh := make(chan error, 1)
	go func() {
		log.Printf("oauth proxy listening on %s for %s (callback %s/oauth/callback)", cfg.Listen, strings.Join(cfg.AllowedOrigins, ", "), cfg.PublicBaseURL)
		errCh <- srv.ListenAndServe()
	}()

	select {
	case err := <-errCh:
		if err != nil && !errors.Is(err, http.ErrServerClosed) {
			log.Fatalf("server: %v", err)
		}
	case <-ctx.Done():
		log.Print("shutting down")
		shutdownCtx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()
		if err := srv.Shutdown(shutdownCtx); err != nil {
			log.Printf("shutdown: %v", err)
		}
	}
}
