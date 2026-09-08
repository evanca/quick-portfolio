# Site image: the static Astro build served by nginx.
# Built from the repository root (`docker build -f Dockerfile .`) so the
# context matches the oauth image and the RapidFTA layout.

# ---- Stage 1: build the Astro site ----------------------------------------
FROM node:22-alpine AS build

WORKDIR /app/site

# Install from the lockfile first so dependency layers cache across content
# edits (every CMS save is a new build of this image).
COPY site/package.json site/package-lock.json ./
RUN npm ci --no-audit --no-fund

COPY site/ ./

# PR previews pass SITE_URL=https://pr-<n>.thomasjbarlow.com so canonical
# links and the sitemap point at the preview.
ARG SITE_URL
ENV SITE_URL=${SITE_URL}

# `npm run build` also runs the postbuild step (pagefind search index) and
# the prebuild step (copies the Sveltia CMS bundle into public/admin).
RUN npm run build

# ---- Stage 2: runtime ------------------------------------------------------
FROM nginx:1.27-alpine

# The official entrypoint renders /etc/nginx/templates/*.template with
# envsubst into /etc/nginx/conf.d/. Restrict substitution to the one variable
# we use so nginx's own $variables are left alone.
ENV NGINX_ENVSUBST_FILTER="^ADMIN_ENABLED$"
ENV ADMIN_ENABLED=false

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /app/site/dist /usr/share/nginx/html

EXPOSE 8080

HEALTHCHECK --interval=15s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://localhost:8080/healthz || exit 1
