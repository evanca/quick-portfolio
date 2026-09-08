#!/bin/sh
# Wait until every service in a stack reports all desired replicas running.
# Usage: wait-for-stack.sh <stack> [timeout-seconds]
# Lives in a script because Task renders command bodies as Go templates, which
# would swallow docker's --format '{{...}}'.
set -eu
stack=$1
timeout=${2:-120}
start=$(date +%s)
while true; do
  counts=$(docker stack services "$stack" --format '{{.Replicas}}' \
    | awk -F/ '{ready += $1 + 0; desired += $2 + 0} END {print ready + 0, desired + 0}')
  ready=${counts% *}
  desired=${counts#* }
  elapsed=$(( $(date +%s) - start ))
  echo "Ready replicas: $ready / $desired (${elapsed}s)"
  if [ "$desired" -gt 0 ] && [ "$ready" -eq "$desired" ]; then
    echo "All services are healthy."
    exit 0
  fi
  if [ "$elapsed" -gt "$timeout" ]; then
    echo "Timeout waiting for $stack to become healthy." >&2
    docker stack ps "$stack" --no-trunc --filter desired-state=running
    exit 1
  fi
  sleep 2
done
