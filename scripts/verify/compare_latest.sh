#!/usr/bin/env bash
set -euo pipefail

# Compare latest pulled snapshot with current local state.
# Run on M4 secondary host after pull_primary_state.sh.

SNAPSHOT_LINK="./state/current/latest"

if [[ ! -L "${SNAPSHOT_LINK}" ]]; then
  echo "[error] no snapshot link found at ${SNAPSHOT_LINK}" >&2
  exit 1
fi

STAMP="$(readlink "${SNAPSHOT_LINK}")"
SNAPSHOT_DIR="./state/snapshots/${STAMP}"
PRIMARY_DIR="${SNAPSHOT_DIR}/primary_base"
LOCAL_DIR="./"

if [[ ! -d "${PRIMARY_DIR}" ]]; then
  echo "[error] missing primary snapshot directory" >&2
  exit 1
fi

echo "[info] comparing snapshot ${STAMP}"

# High-level diff summary
diff -qr \
  --exclude '.git' \
  --exclude 'state' \
  "${PRIMARY_DIR}" "${LOCAL_DIR}" > "${SNAPSHOT_DIR}/diff_summary.txt" || true

# Hash critical files if present
CRITICAL_FILES=(
  "config.yaml"
  "settings.json"
)

{
  echo "timestamp_utc=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  for f in "${CRITICAL_FILES[@]}"; do
    if [[ -f "${PRIMARY_DIR}/${f}" ]]; then
      echo "primary_${f}=$(sha256sum "${PRIMARY_DIR}/${f}" | awk '{print $1}')"
    fi
    if [[ -f "${LOCAL_DIR}/${f}" ]]; then
      echo "local_${f}=$(sha256sum "${LOCAL_DIR}/${f}" | awk '{print $1}')"
    fi
  done
} > "${SNAPSHOT_DIR}/hash_report.txt"

echo "[ok] diff + hash report written to ${SNAPSHOT_DIR}"
