package main

import (
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"net/url"
	"strings"
	"testing"
)

const testSecret = "super-secret-client-secret"

func testServer(t *testing.T) *server {
	t.Helper()
	base, _ := url.Parse("https://thomasjbarlow.com")
	return newServer(&config{
		Listen:         ":0",
		PublicBaseURL:  base,
		AllowedOrigins: []string{"https://thomasjbarlow.com", "http://localhost:4321"},
		ClientID:       "client-id-123",
		ClientSecret:   testSecret,
	})
}

func TestAuthRedirectsToGitHub(t *testing.T) {
	s := testServer(t)
	rec := httptest.NewRecorder()
	req := httptest.NewRequest(http.MethodGet, "/oauth/auth?provider=github&site_id=thomasjbarlow.com&scope=repo", nil)
	s.handler().ServeHTTP(rec, req)

	if rec.Code != http.StatusFound {
		t.Fatalf("status = %d, want 302; body %q", rec.Code, rec.Body.String())
	}
	loc, err := url.Parse(rec.Header().Get("Location"))
	if err != nil {
		t.Fatal(err)
	}
	if got := loc.Scheme + "://" + loc.Host + loc.Path; got != "https://github.com/login/oauth/authorize" {
		t.Errorf("redirect target = %s", got)
	}
	q := loc.Query()
	if q.Get("client_id") != "client-id-123" {
		t.Errorf("client_id = %q", q.Get("client_id"))
	}
	if q.Get("redirect_uri") != "https://thomasjbarlow.com/oauth/callback" {
		t.Errorf("redirect_uri = %q", q.Get("redirect_uri"))
	}
	if q.Get("scope") != "repo" {
		t.Errorf("scope = %q", q.Get("scope"))
	}
	state := q.Get("state")
	if len(state) != 32 {
		t.Errorf("state = %q, want 32 hex chars", state)
	}
	var cookie *http.Cookie
	for _, c := range rec.Result().Cookies() {
		if c.Name == stateCookieName {
			cookie = c
		}
	}
	if cookie == nil {
		t.Fatal("state cookie not set")
	}
	if cookie.Value != state || !cookie.HttpOnly || !cookie.Secure || cookie.SameSite != http.SameSiteLaxMode {
		t.Errorf("cookie = %+v, want value %q HttpOnly Secure Lax", cookie, state)
	}
	if rec.Header().Get("Cache-Control") != "no-store" {
		t.Errorf("Cache-Control = %q", rec.Header().Get("Cache-Control"))
	}
}

func TestAuthDefaultScopeAndHostWithPort(t *testing.T) {
	s := testServer(t)
	rec := httptest.NewRecorder()
	req := httptest.NewRequest(http.MethodGet, "/oauth/auth?provider=github&site_id=localhost:4321", nil)
	s.handler().ServeHTTP(rec, req)
	if rec.Code != http.StatusFound {
		t.Fatalf("status = %d, want 302; body %q", rec.Code, rec.Body.String())
	}
	loc, _ := url.Parse(rec.Header().Get("Location"))
	if got := loc.Query().Get("scope"); got != "repo user" {
		t.Errorf("default scope = %q, want %q", got, "repo user")
	}
}

func TestAuthRejectsBadRequests(t *testing.T) {
	s := testServer(t)
	cases := map[string]struct {
		query string
		want  int
	}{
		"wrong provider":   {"provider=gitlab&site_id=thomasjbarlow.com", http.StatusBadRequest},
		"missing provider": {"site_id=thomasjbarlow.com", http.StatusBadRequest},
		"unknown site":     {"provider=github&site_id=evil.example.com", http.StatusForbidden},
		"missing site":     {"provider=github", http.StatusForbidden},
		"bad scope":        {"provider=github&site_id=thomasjbarlow.com&scope=admin:org", http.StatusBadRequest},
	}
	for name, tc := range cases {
		t.Run(name, func(t *testing.T) {
			rec := httptest.NewRecorder()
			req := httptest.NewRequest(http.MethodGet, "/oauth/auth?"+tc.query, nil)
			s.handler().ServeHTTP(rec, req)
			if rec.Code != tc.want {
				t.Errorf("status = %d, want %d", rec.Code, tc.want)
			}
			if rec.Header().Get("Location") != "" {
				t.Errorf("unexpected redirect to %s", rec.Header().Get("Location"))
			}
		})
	}
}

func TestCallbackRejectsBadState(t *testing.T) {
	s := testServer(t)
	cases := map[string]*http.Cookie{
		"no cookie":     nil,
		"mismatched":    {Name: stateCookieName, Value: "other"},
		"missing state": {Name: stateCookieName, Value: "abc"},
	}
	for name, cookie := range cases {
		t.Run(name, func(t *testing.T) {
			target := "/oauth/callback?code=xyz&state=abc"
			if name == "missing state" {
				target = "/oauth/callback?code=xyz"
			}
			rec := httptest.NewRecorder()
			req := httptest.NewRequest(http.MethodGet, target, nil)
			if cookie != nil {
				req.AddCookie(cookie)
			}
			s.handler().ServeHTTP(rec, req)
			if rec.Code != http.StatusBadRequest {
				t.Errorf("status = %d, want 400", rec.Code)
			}
			body := rec.Body.String()
			if !strings.Contains(body, `const status = "error"`) || strings.Contains(body, `"token"`) {
				t.Errorf("body should be an error page without a token:\n%s", body)
			}
		})
	}
}

func TestCallbackExchangesCodeAndRendersHandshake(t *testing.T) {
	s := testServer(t)

	var gotBody map[string]string
	github := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost || r.Header.Get("Accept") != "application/json" {
			t.Errorf("unexpected request: %s %s Accept=%q", r.Method, r.URL, r.Header.Get("Accept"))
		}
		raw, _ := io.ReadAll(r.Body)
		if err := json.Unmarshal(raw, &gotBody); err != nil {
			t.Errorf("body is not JSON: %v", err)
		}
		w.Header().Set("Content-Type", "application/json")
		io.WriteString(w, `{"access_token":"gho_testtoken123","token_type":"bearer","scope":"repo"}`)
	}))
	defer github.Close()
	s.githubTokenURL = github.URL

	rec := httptest.NewRecorder()
	req := httptest.NewRequest(http.MethodGet, "/oauth/callback?code=the-code&state=state-1", nil)
	req.AddCookie(&http.Cookie{Name: stateCookieName, Value: "state-1"})
	s.handler().ServeHTTP(rec, req)

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200; body %s", rec.Code, rec.Body.String())
	}
	if gotBody["code"] != "the-code" || gotBody["client_id"] != "client-id-123" || gotBody["client_secret"] != testSecret {
		t.Errorf("token request body = %v", gotBody)
	}

	body := rec.Body.String()
	for _, want := range []string{
		`"authorizing:" + provider`,
		`"authorization:" + provider + ":" + status + ":" + JSON.stringify(content)`,
		`const status = "success"`,
		`{"provider":"github","token":"gho_testtoken123"}`,
		`["https://thomasjbarlow.com","http://localhost:4321"]`,
		`addEventListener("message"`,
	} {
		if !strings.Contains(body, want) {
			t.Errorf("callback page missing %q:\n%s", want, body)
		}
	}
	if strings.Contains(body, testSecret) {
		t.Error("callback page leaks the client secret")
	}

	csp := rec.Header().Get("Content-Security-Policy")
	if !strings.Contains(csp, "script-src 'nonce-") || !strings.Contains(csp, "default-src 'none'") {
		t.Errorf("CSP = %q", csp)
	}
	nonce := strings.TrimSuffix(strings.SplitN(csp, "'nonce-", 2)[1], "'")
	nonce = strings.SplitN(nonce, "'", 2)[0]
	if !strings.Contains(body, `<script nonce="`+nonce+`">`) {
		t.Errorf("script nonce %q not present in body", nonce)
	}
	if rec.Header().Get("Cache-Control") != "no-store" {
		t.Errorf("Cache-Control = %q", rec.Header().Get("Cache-Control"))
	}

	var cleared bool
	for _, c := range rec.Result().Cookies() {
		if c.Name == stateCookieName && c.MaxAge < 0 {
			cleared = true
		}
	}
	if !cleared {
		t.Error("state cookie was not cleared after use")
	}
}

func TestCallbackReportsGitHubErrors(t *testing.T) {
	s := testServer(t)
	github := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		io.WriteString(w, `{"error":"bad_verification_code","error_description":"The code passed is incorrect or expired."}`)
	}))
	defer github.Close()
	s.githubTokenURL = github.URL

	rec := httptest.NewRecorder()
	req := httptest.NewRequest(http.MethodGet, "/oauth/callback?code=bad&state=s", nil)
	req.AddCookie(&http.Cookie{Name: stateCookieName, Value: "s"})
	s.handler().ServeHTTP(rec, req)

	if rec.Code != http.StatusBadGateway {
		t.Errorf("status = %d, want 502", rec.Code)
	}
	body := rec.Body.String()
	if !strings.Contains(body, `const status = "error"`) || strings.Contains(body, "gho_") {
		t.Errorf("unexpected body:\n%s", body)
	}
	// GitHub's wording is logged, not shown: the page carries a generic message.
	if strings.Contains(body, "incorrect or expired") {
		t.Errorf("GitHub error text leaked to the page:\n%s", body)
	}
}

func TestHealth(t *testing.T) {
	s := testServer(t)
	rec := httptest.NewRecorder()
	s.handler().ServeHTTP(rec, httptest.NewRequest(http.MethodGet, "/oauth/health", nil))
	if rec.Code != http.StatusOK || rec.Body.String() != "ok" {
		t.Errorf("health = %d %q", rec.Code, rec.Body.String())
	}
}

func TestParseKeyValueFile(t *testing.T) {
	in := "# GitHub OAuth app\r\n\r\nGITHUB_CLIENT_ID=abc123\r\n  GITHUB_CLIENT_SECRET = \"s3cr=et\" \n\n# trailing comment\nEMPTY=\n"
	got, err := parseKeyValueFile(strings.NewReader(in))
	if err != nil {
		t.Fatal(err)
	}
	want := map[string]string{"GITHUB_CLIENT_ID": "abc123", "GITHUB_CLIENT_SECRET": "s3cr=et", "EMPTY": ""}
	if len(got) != len(want) {
		t.Fatalf("got %v, want %v", got, want)
	}
	for k, v := range want {
		if got[k] != v {
			t.Errorf("%s = %q, want %q", k, got[k], v)
		}
	}
	if _, err := parseKeyValueFile(strings.NewReader("no equals sign\n")); err == nil {
		t.Error("expected an error for a malformed line")
	}
}

func TestLoadConfigFailsFast(t *testing.T) {
	t.Setenv("PUBLIC_BASE_URL", "")
	t.Setenv("ALLOWED_ORIGINS", "")
	t.Setenv("OAUTH_SECRETS_FILE", t.TempDir()+"/missing")
	t.Setenv("GITHUB_CLIENT_ID", "")
	t.Setenv("GITHUB_CLIENT_SECRET", "")
	if _, err := loadConfig(); err == nil || !strings.Contains(err.Error(), "PUBLIC_BASE_URL") {
		t.Errorf("expected PUBLIC_BASE_URL error, got %v", err)
	}

	t.Setenv("PUBLIC_BASE_URL", "https://thomasjbarlow.com/")
	if _, err := loadConfig(); err == nil || !strings.Contains(err.Error(), "ALLOWED_ORIGINS") {
		t.Errorf("expected ALLOWED_ORIGINS error, got %v", err)
	}

	t.Setenv("ALLOWED_ORIGINS", "https://thomasjbarlow.com, http://localhost:4321")
	if _, err := loadConfig(); err == nil || !strings.Contains(err.Error(), "GITHUB_CLIENT_ID") {
		t.Errorf("expected client id/secret error, got %v", err)
	}

	t.Setenv("GITHUB_CLIENT_ID", "id")
	t.Setenv("GITHUB_CLIENT_SECRET", "secret")
	cfg, err := loadConfig()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.PublicBaseURL.String() != "https://thomasjbarlow.com" || len(cfg.AllowedOrigins) != 2 || cfg.AllowedOrigins[1] != "http://localhost:4321" {
		t.Errorf("config = %+v", cfg)
	}
}
