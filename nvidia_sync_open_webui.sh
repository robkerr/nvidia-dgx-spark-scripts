#!/usr/bin/env bash
set -euo pipefail

NAME="open-webui"

cleanup() {
  echo "Signal received; stopping ${NAME}..."
  docker stop "${NAME}" >/dev/null 2>&1 || true
  exit 0
}
trap cleanup INT TERM HUP QUIT EXIT


if [ -n "$(docker ps -q --filter "name=^${NAME}$" --filter "status=running")" ]; then
  echo "Container ${NAME} is already running."
else
  echo "Starting existing container ${NAME}..."
  docker start ${NAME}
fi

echo "Running. Press Ctrl+C to stop ${NAME}."
# Keep the script alive until a signal arrives
while :; do sleep 86400; done
