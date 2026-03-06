#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/docker/docker-compose.yml"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required" >&2
  exit 1
fi

echo "Starting n8n service..."
docker compose -f "${COMPOSE_FILE}" up -d n8n

echo "Exporting workflows to /workflows..."
docker compose -f "${COMPOSE_FILE}" exec -T n8n n8n export:workflow --all --pretty --separate --output=/workflows

echo "Workflow export complete."
