#!/bin/sh
# Remove this stack's versioned secrets that belong to versions other than the
# one given. Docker refuses to remove a secret that a service still references,
# so the running version is never touched.
# Usage: prune-secrets.sh <version>
set -u
keep=$1
docker secret ls --format '{{.Name}}' \
  | grep -E '^thomasjbarlow_[a-z_]+_v[A-Za-z0-9]+$' \
  | grep -v "_v${keep}$" \
  | while read -r name; do
      docker secret rm "$name" >/dev/null 2>&1 && echo "removed $name" || true
    done
exit 0
