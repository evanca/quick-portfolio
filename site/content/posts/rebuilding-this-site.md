---
title: Rebuilding this site
description: The new thomasjbarlow.com runs on Astro with a browser-based CMS, deploys from a Docker Swarm at home, and gets a preview environment for every pull request.
publishDate: 2026-09-08
draft: true
tags:
  - astro
  - docker
  - meta
---

This is a draft placeholder so the blog has something to render. Delete it or finish it from the CMS at `/admin`.

The short version of what changed:

- The old site was a Jekyll theme on GitHub Pages that needed a commit for every edit.
- The new one is an [Astro](https://astro.build) static site with [Sveltia CMS](https://github.com/sveltia/sveltia-cms) at `/admin`. Saving in the CMS commits to the repository, and a workflow rebuilds and redeploys the site in about two minutes.
- It runs as an nginx container on a Docker Swarm at home, reached through a Cloudflare tunnel. Every pull request gets its own preview stack at `pr-<n>.thomasjbarlow.com`.

:::note
Admonitions, GitHub cards and code blocks with syntax highlighting all work in posts. See the Astro Cactus theme docs for the syntax.
:::
