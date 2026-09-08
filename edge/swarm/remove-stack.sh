#!/bin/sh
# Remove a stack and wait until Swarm has actually torn it down (docker stack
# rm returns before the tasks and the stack's own network are gone).
# Usage: remove-stack.sh <stack>
set -u
stack=$1
if ! docker stack ls --format '{{.Name}}' | grep -qx "$stack"; then
  echo "$stack is not deployed"
  exit 0
fi
docker stack rm "$stack"
while docker stack ls --format '{{.Name}}' | grep -qx "$stack"; do
  echo "waiting for $stack to be removed..."
  sleep 3
done
sleep 5
echo "$stack removed"
