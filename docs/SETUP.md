# One-Time Setup

Everything the pipeline cannot do for itself. Do the steps in order; each
says exactly what to click or run. Steps 1 to 5 can be done before the
`astro-rebuild` branch merges; steps 6 onward switch the live domain.

## 1. Rename the repository

GitHub: repository **Settings → General → Repository name**, change
`barlowtj48.github.io` to `thomasjbarlow.com`, click **Rename**. GitHub
redirects the old name, but update the local clone anyway:

```sh
git remote set-url origin https://github.com/barlowtj48/thomasjbarlow.com.git
git remote remove upstream   # the old quick-portfolio theme; no longer relevant
```

Also rename the default branch to `main` if it is still `master`:
**Settings → General → Default branch → pencil icon → `main`**, then locally
`git branch -m master main && git fetch origin && git branch -u origin/main main`.
The workflows trigger on `main`.

## 2. Register the self-hosted runners

Runners are repo-scoped, so this repo needs its own pair. On `mediapc`:

1. GitHub: **Settings → Actions → Runners → New self-hosted runner → Linux**.
   Copy the token from the `./config.sh --token ...` line (it expires in an
   hour; get a fresh one per runner).
2. In the `server-apps` checkout on `mediapc`:

   ```sh
   cd server-apps/runners/thomasjbarlow-runner
   printf 'RUNNER_TOKEN_1=<token 1>\nRUNNER_TOKEN_2=<token 2>\n' > .env
   sudo docker compose up --pull always -d      # or: task start:thomasjbarlow from server-apps/runners
   ```

3. Back in **Settings → Actions → Runners**, both
   `mediapc-thomasjbarlow-action-runner-1/2` show **Idle** with labels
   `self-hosted`, `linux`, `x64`, `docker`.

## 3. GitHub OAuth App for the CMS sign-in

1. GitHub: your avatar → **Settings → Developer settings → OAuth Apps → New OAuth App**.
2. Application name `thomasjbarlow.com CMS`, Homepage URL
   `https://thomasjbarlow.com`, Authorization callback URL
   `https://thomasjbarlow.com/oauth/callback`. Leave "Device Flow" off.
   **Register application**.
3. Copy the **Client ID**; click **Generate a new client secret** and copy it.
4. Repository **Settings → Secrets and variables → Actions → New repository secret**:
   `OAUTH_GITHUB_CLIENT_ID` and `OAUTH_GITHUB_CLIENT_SECRET`.

For local runs (`task up:local`) make a second OAuth App with callback
`http://localhost:8081/oauth/callback` and put its values in
`secrets/oauth.local.env` (`GITHUB_CLIENT_ID=...`, `GITHUB_CLIENT_SECRET=...`);
that file is git-ignored.

## 4. Registry secrets

Same values RapidFTA and BarlowFabrication use for `registry.thomasjbarlow.com`:
repository secrets `DOCKER_REGISTRY_USERNAME` and `DOCKER_REGISTRY_PASSWORD`.

## 5. Cloudflare Tunnel

1. Cloudflare dashboard → **Zero Trust → Networks → Tunnels → Create a tunnel → Cloudflared**,
   name `thomasjbarlow-edge`, **Save tunnel**.
2. On the connector page, copy the token from the `cloudflared ... install <token>`
   command (the long string after `install`). Do not install anything; the
   stack runs the connector. Click **Next**.
3. **Public Hostnames** tab, add three hostnames, each with Type `HTTP` and
   URL `edge-traefik:8080`:

   | Subdomain | Domain             |
   | --------- | ------------------ |
   | (empty)   | thomasjbarlow.com  |
   | www       | thomasjbarlow.com  |
   | *         | thomasjbarlow.com  |

   The dashboard warns that the apex and www records already exist if the
   GitHub Pages records are still there; see step 6.
4. Repository secret `CLOUDFLARE_TUNNEL_TOKEN` = the token from 5.2.

## 6. DNS cutover (this takes the site live on the new stack)

Do this after the first successful deploy (step 9) if you want zero
downtime: the stack can run before DNS points at it.

1. Cloudflare → **thomasjbarlow.com → DNS → Records**. Delete the four `A`
   records for `thomasjbarlow.com` pointing at `185.199.108.153`,
   `185.199.109.153`, `185.199.110.153`, `185.199.111.153`, and any `www`
   CNAME to `barlowtj48.github.io`.
2. Back in **Zero Trust → Tunnels → thomasjbarlow-edge → Public Hostname**,
   edit and re-save the apex and `www` hostnames so the tunnel creates its
   proxied CNAMEs to `<tunnel-id>.cfargotunnel.com` (it only does so when no
   record exists).
3. The wildcard hostname does **not** create DNS. Add it by hand: **DNS → Add
   record**, Type `CNAME`, Name `*`, Target `<tunnel-id>.cfargotunnel.com`
   (the tunnel ID is on the tunnel's page), Proxy status **Proxied**. A
   wildcard only matches names that do not already exist, so
   `registry.`, `managemovies.`, `managetv.`, `requests.` and the rest keep
   their own records.
4. Check: `curl -sI https://thomasjbarlow.com/` returns `200` with a
   `cf-ray` header, `curl -sI https://www.thomasjbarlow.com/` returns `301`.

## 7. Cloudflare Access in front of the CMS

Sveltia's sign-in is GitHub OAuth, but the admin page itself is public HTML;
Access keeps it, and the proxy, off the open internet.

1. **Zero Trust → Access → Applications → Add an application → Self-hosted**.
2. Application name `thomasjbarlow CMS`. Under **Application domain** add two
   entries: domain `thomasjbarlow.com` path `admin`, and domain
   `thomasjbarlow.com` path `oauth`. Session duration 24 hours.
3. **Add a policy**: name `Owner`, action **Allow**, include rule **Emails**
   = your address. Identity provider: the default **One-time PIN** works;
   **GitHub** can be added under **Settings → Authentication** for one fewer
   prompt.
4. Save. `https://thomasjbarlow.com/admin/` now shows the Access login first.

## 8. Cloudflare Web Analytics

1. Cloudflare → **Web Analytics → Add a site**, hostname `thomasjbarlow.com`,
   choose **manual (JS snippet)**. Copy the `token` value from the snippet.
2. Put it in `site/src/site.config.ts` as `cloudflareAnalyticsToken` and
   merge. The beacon is only rendered when the token is set.

## 9. First deploy

1. Confirm the secrets from steps 3 to 5 exist: `DOCKER_REGISTRY_USERNAME`,
   `DOCKER_REGISTRY_PASSWORD`, `OAUTH_GITHUB_CLIENT_ID`,
   `OAUTH_GITHUB_CLIENT_SECRET`, `CLOUDFLARE_TUNNEL_TOKEN`.
2. Open the `astro-rebuild` PR. **Build and Preview** runs; its summary shows
   `https://pr-<n>.thomasjbarlow.com` (works once step 6.3 is done).
3. Merge. **Deploy Production** runs `task deploy:prod:tag -- <sha>`. Watch
   the run, then on `mediapc`:

   ```sh
   docker stack services thomasjbarlow     # site, oauth, edge-traefik, cloudflared all 1/1
   docker service logs --tail 20 thomasjbarlow_cloudflared   # "Registered tunnel connection"
   ```

4. Sign in at `https://thomasjbarlow.com/admin/`, edit the About page, save.
   A Deploy run starts within a minute; the change is live when it finishes.

## 10. Turn off GitHub Pages

Repository **Settings → Pages → Build and deployment → Source: None**. The
`CNAME` file is already gone from the branch. The old Jekyll `_config.yml`
and pages live on in git history only.

## 11. Rotate the leaked Cloudflare API key

`server-apps/network-admin/proxy-stack.yml` contains a Cloudflare API key in
plaintext (the `cloudflare-ddns-*` services). Cloudflare → **My Profile →
API Tokens → API Keys → Global API Key → Change**, then move the DDNS
services to a scoped **API Token** (Zone → DNS → Edit) supplied through an
env file or a Docker secret, and rewrite the git history or treat the old
key as burned.
