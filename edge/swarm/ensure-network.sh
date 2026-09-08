#!/bin/sh
# Create one of the stack's overlays if it is missing, verify its options
# otherwise. Run on a manager (the deploy runner is one) at the start of every
# deploy (task swarm:network); both networks are external to the stacks, so
# `docker stack deploy` would otherwise fail with "network not found".
#
# Why a dedicated overlay with MTU 1200: node-to-node traffic on this Swarm
# rides Tailscale (MTU 1280) and VXLAN adds about 50 bytes, so packets larger
# than roughly 1230 bytes between nodes are dropped. Docker cannot change the
# MTU of an existing network, hence one per stack (same as RapidFTA and
# BarlowFabrication). --internal: no egress; the connector and the OAuth proxy
# are additionally on external-network. --attachable lets one-off containers
# join for checks.
set -eu

NETWORK=${NETWORK:-thomasjbarlow-network}
MTU=${MTU:-1200}
DOCKER=${DOCKER:-docker}

if [ "$("$DOCKER" info --format '{{.Swarm.ControlAvailable}}')" != "true" ]; then
  echo "ensure-network: this node is not a Swarm manager" >&2
  exit 1
fi

if "$DOCKER" network inspect "$NETWORK" >/dev/null 2>&1; then
  have_mtu=$("$DOCKER" network inspect "$NETWORK" --format '{{index .Options "com.docker.network.driver.mtu"}}')
  internal=$("$DOCKER" network inspect "$NETWORK" --format '{{.Internal}}')
  attachable=$("$DOCKER" network inspect "$NETWORK" --format '{{.Attachable}}')
  echo "ensure-network: $NETWORK exists: mtu=${have_mtu:-unset} internal=$internal attachable=$attachable"
  if [ "$have_mtu" != "$MTU" ] || [ "$internal" != "true" ] || [ "$attachable" != "true" ]; then
    echo "ensure-network: $NETWORK does not have mtu=$MTU internal=true attachable=true; Docker cannot change these in place. Remove the stacks, then the network, and rerun." >&2
    exit 1
  fi
  exit 0
fi

echo "ensure-network: creating $NETWORK (overlay, internal, attachable, mtu=$MTU)"
"$DOCKER" network create \
  --driver overlay \
  --attachable \
  --internal \
  --opt "com.docker.network.driver.mtu=$MTU" \
  "$NETWORK" >/dev/null
"$DOCKER" network inspect "$NETWORK" --format 'ensure-network: created {{.Name}} {{.Driver}} internal={{.Internal}} attachable={{.Attachable}} options={{json .Options}}'
