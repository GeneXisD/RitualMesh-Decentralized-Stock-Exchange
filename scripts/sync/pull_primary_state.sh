#!/usr/bin/env bash
set -euo pipefail

# Pull a structured snapshot from the canonical Intel/Ubuntu 14.04 federated node.
# This script is intended to run on the M4 secondary host.
#
# Required environment variables:
#   PRIMARY_HOST       e.g. 192.168.0.17
# Optional environment variables:
#   PRIMARY_USER       default: victor
#   PRIMARY_PORT       default: 22
#   PRIMARY_BASE_PATH  default: /opt/ritualmesh
#   SNAPSHOT_ROOT      default: ./state/snapshots
#
# Example:
#   PRIMARY_HOST=192.168.0.17 PRIMARY_USER=victor ./scripts/sync/pull_primary_state.sh

PRIMARY_HOST="${PRIMARY_HOST:-}"
PRIMARY_USER="${PRIMARY_USER:-victor}"
PRIMARY_PORT="${PRIMARY_PORT:-22}"
PRIMARY_BASE_PATH="${PRIMARY_BASE_PATH:-/opt/ritualmesh}"
SNAPSHOT_ROOT="${SNAPSHOT_ROOT:-./state/snapshots}"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
TARGET_DIR="${SNAPSHOT_ROOT}/${STAMP}"

if [[ -z "${PRIMARY_HOST}" ]]; then
  echo "[error] PRIMARY_HOST is required" >&2
  exit 1
fi

mkdir -p "${TARGET_DIR}" "./state/current"

echo "[info] pulling from ${PRIMARY_USER}@${PRIMARY_HOST}:${PRIMARY_BASE_PATH}"

ssh -p "${PRIMARY_PORT}" "${PRIMARY_USER}@${PRIMARY_HOST}" "bash -s" <<'REMOTE' > "${TARGET_DIR}/host_inventory.txt"
set -euo pipefail

echo "timestamp_utc=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "hostname=$(hostname 2>/dev/null || uname -n)"
echo "kernel=$(uname -a)"
echo "pwd=$(pwd)"
echo "--- ports ---"
(netstat -tulpn 2>/dev/null || netstat -an 2>/dev/null || true)
echo "--- processes ---"
(ps aux 2>/dev/null || ps -ef 2>/dev/null || true)
REMOTE

rsync -avz -e "ssh -p ${PRIMARY_PORT}" \
  --exclude '*.log' \
  --exclude 'tmp/' \
  --exclude '.git/' \
  "${PRIMARY_USER}@${PRIMARY_HOST}:${PRIMARY_BASE_PATH}/" \
  "${TARGET_DIR}/primary_base/"

cat > "${TARGET_DIR}/snapshot.env" <<EOF
SNAPSHOT_TIMESTAMP=${STAMP}
PRIMARY_HOST=${PRIMARY_HOST}
PRIMARY_USER=${PRIMARY_USER}
PRIMARY_PORT=${PRIMARY_PORT}
PRIMARY_BASE_PATH=${PRIMARY_BASE_PATH}
EOF

ln -sfn "${STAMP}" "./state/current/latest"

echo "[ok] snapshot stored at ${TARGET_DIR}"
