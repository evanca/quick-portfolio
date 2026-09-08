#!/bin/sh
# Remove superseded hashed Traefik configs. Configs still referenced by a
# running service cannot be removed, so those failures are expected and
# ignored; only the configs from earlier deploys go away.
docker config ls --format '{{.Name}}' \
  | grep -E '^thomasjbarlow_edge_traefik_(static|dynamic)_' \
  | while read -r cfg; do
      docker config rm "$cfg" >/dev/null 2>&1 && echo "removed $cfg" || true
    done
exit 0
