# Operations

thomasjbarlow.com is a static Astro site served by nginx from a Docker Swarm
stack on `mediapc`, published through its own Cloudflare Tunnel. There is no
database and no failover: while `mediapc` is down, the site is down.

## Request Path

1. Cloudflare terminates TLS and sends the request through the remotely
   managed tunnel `thomasjbarlow-edge` to its connector, `thomasjbarlow_cloudflared`.
2. The connector dials the tunnel's service URL `http://edge-traefik:8080`.
   The edge Traefik is one task on the same node as the connector, so the hop
   never leaves `mediapc`.
3. Traefik ([edge/traefik/dynamic.yml](../edge/traefik/dynamic.yml)) routes
   `thomasjbarlow.com/oauth/*` to the OAuth proxy, everything else on the apex
   to the `site` service (nginx, health-checked on `/healthz`), and redirects
   `www.` to the apex. TLS ends at Cloudflare, so only the plain `web`
   entrypoint exists.
4. `pr-<n>.thomasjbarlow.com` reaches the same Traefik through the tunnel's
   wildcard hostname and is routed by its Swarm provider from the labels of
   the preview stack (see below).

The stack runs on its own overlay, `thomasjbarlow-network` (internal,
attachable, MTU 1200), plus `thomasjbarlow-preview-network` shared with the
previews. `task swarm:network` creates both; every deploy runs it first.
`external-network` gives the connector and the OAuth proxy their egress.

## How a CMS Save Reaches Production

1. Saving in `/admin` (Sveltia CMS) commits to `main` through the GitHub API
   with the editor's own OAuth token.
2. The push triggers [Deploy.yml](../.github/workflows/Deploy.yml) on the
   self-hosted runner: build the site image tagged with the short sha, build
   the OAuth image, create the versioned secrets, `task deploy:prod:tag -- <sha>`.
3. `site` is updated start-first: the new task must pass `/healthz` before the
   old one is stopped, so there is no gap. About two minutes end to end.

Code changes take the same path after the PR merges.

## PR Previews

Every pull request deploys stack `thomasjbarlow-pr-<n>` from
[stack.pr.yml](../stack.pr.yml) ([Build.yml](../.github/workflows/Build.yml))
and is served at `pr-<n>.thomasjbarlow.com`. The preview is the site container
alone, with `ADMIN_ENABLED=false`, so it can never sign in or commit. It is
removed when the PR closes ([Cleanup.yml](../.github/workflows/Cleanup.yml));
by hand: `task remove:pr -- <n>`.

Previews depend on two dashboard items that are set up once
([SETUP.md](SETUP.md)): the wildcard public hostname on the tunnel and a
proxied `*` CNAME in the zone. Without the CNAME, `pr-<n>` does not resolve.

## Routine Checks

After each deploy and now and then:

```sh
docker stack services thomasjbarlow          # 1/1 on all four services
task status                                  # same, plus the connector log
curl -sI https://thomasjbarlow.com/healthz   # 200
curl -sI https://www.thomasjbarlow.com/      # 301 to the apex
curl -sI https://thomasjbarlow.com/admin/    # Cloudflare Access login, not the site
```

The connector log should contain no `Unable to reach the origin service`
lines. A preview that answers 404 means the edge Traefik does not see its
labels: check `docker service inspect thomasjbarlow-pr-<n>_site` for the
`thomasjbarlow.edge=true` label and that the service is on
`thomasjbarlow-preview-network`.

## Rollback

Production is whatever image tag the last `task deploy:prod:tag` used. To go
back to an earlier sha:

1. Find it: `git log --oneline main` or the Actions history.
2. The versioned secrets for that sha were pruned by the deploy that replaced
   it, so recreate them on the runner (or on `mediapc`) before deploying:

   ```sh
   VERSION=<older sha>
   printf 'GITHUB_CLIENT_ID=...\nGITHUB_CLIENT_SECRET=...\n' | docker secret create thomasjbarlow_oauth_secrets_v${VERSION} -
   printf '%s' "<tunnel token>" | docker secret create thomasjbarlow_cloudflare_tunnel_token_v${VERSION} -
   task deploy:prod:tag -- ${VERSION}
   ```

   The simpler route is to revert the offending commit on `main` and let
   Deploy.yml run; that needs no secret handling.

Re-running a Deploy workflow run from the Actions tab redeploys that run's
sha the same way (it recreates the secrets itself).

## Image Pinning

`traefik` and `cloudflared` in [stack.yml](../stack.yml) are pinned by digest
to the builds RapidFTA verified on 2026-09-02; the tag next to the digest is
documentation. To move one, change tag and digest together. The site and
OAuth images are selected by `SITE_VERSION` and are not digest-pinned; every
sha is a fresh build.

The site image is built from `node:22` (Astro) into `nginx:alpine`; bumping
either is a Dockerfile change that goes through a PR and its preview like any
other code change.
