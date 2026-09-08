# thomasjbarlow.com

Personal site: blog, projects, work history. Static [Astro](https://astro.build)
site with [Sveltia CMS](https://github.com/sveltia/sveltia-cms) at `/admin`,
served by nginx from a Docker Swarm stack on `mediapc` behind a Cloudflare
Tunnel, with a preview stack per pull request.

| Path | What |
| --- | --- |
| `site/` | The Astro site. Content lives in `site/content/` (posts, projects, work, pages) as markdown with frontmatter. |
| `site/public/admin/` | Sveltia CMS page and `config.yml` (the editable collections). |
| `oauth/` | Tiny Go service that completes the GitHub OAuth sign-in for the CMS. |
| `nginx/`, `Dockerfile` | The site image: nginx serving the build, legacy redirects, `/admin` toggle. |
| `stack.yml`, `stack.pr.yml`, `edge/` | Swarm stacks (production, PR preview) and the edge Traefik config. |
| `.github/workflows/` | `Build.yml` (PR preview), `Deploy.yml` (push to main), `Cleanup.yml` (PR closed). |
| `docs/SETUP.md` | One-time setup checklist (runners, OAuth app, tunnel, DNS, Access). |
| `docs/OPERATIONS.md` | Request path, how a CMS save reaches production, checks, rollback. |

## Editing content

Sign in at `https://thomasjbarlow.com/admin/` and save. The commit lands on
`main`, the Deploy workflow rebuilds the image and swaps it in, about two
minutes later the change is live. Or edit the markdown under `site/content/`
in a branch and open a PR to get a preview at `pr-<n>.thomasjbarlow.com`.

## Local development

```sh
task dev            # Astro dev server on http://localhost:4321
task check          # what the PR workflow runs (astro check + biome)
task up:local       # the real images: site on :8080, OAuth proxy on :8081
```

Node 22.12+ and Docker are required. The site's theme started from
[Astro Cactus](https://github.com/chrismwilliams/astro-theme-cactus) (MIT,
see `site/LICENSE-astro-cactus`).
