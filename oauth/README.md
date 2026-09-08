# oauth: GitHub sign-in for the CMS

A ~300-line Go service (standard library only) implementing the Decap/Sveltia CMS
"external OAuth client" protocol. The CMS at `/admin` opens `/oauth/auth` in a popup,
GitHub sends the popup back to `/oauth/callback`, and the page hands the token to the
CMS window over `postMessage`. Tokens are never logged or stored.

| Env var | Default | Meaning |
| --- | --- | --- |
| `LISTEN` | `:8081` | Listen address |
| `PUBLIC_BASE_URL` | required | Public origin of this service, e.g. `https://thomasjbarlow.com` |
| `ALLOWED_ORIGINS` | required | Comma-separated CMS origins allowed to sign in |
| `OAUTH_SECRETS_FILE` | `/run/secrets/oauth_secrets` | `KEY=VALUE` file with `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` |
| `GITHUB_CLIENT_ID` / `GITHUB_CLIENT_SECRET` | | Fallback when the secrets file is absent (local use) |

GitHub OAuth app (Settings > Developer settings > OAuth Apps): set the
**Authorization callback URL** to `https://thomasjbarlow.com/oauth/callback`.

Run locally: `cd oauth && PUBLIC_BASE_URL=http://localhost:8081 ALLOWED_ORIGINS=http://localhost:4321 GITHUB_CLIENT_ID=... GITHUB_CLIENT_SECRET=... go run .`
Then `curl http://localhost:8081/oauth/health`. Tests: `go test ./...`.
Image: `docker build -f oauth/Dockerfile .` from the repository root.
