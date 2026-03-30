#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"

mkdir -p "$ROOT/legal" "$ROOT/scripts/legal" "$ROOT/.secrets/public"

copy_if_missing() {
  local src="$1"
  local dst="$2"
  if [ -e "$dst" ]; then
    echo "[i] Exists, leaving in place: $dst"
  else
    cp "$src" "$dst"
    echo "[+] Installed: $dst"
  fi
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

copy_if_missing "$REPO_ROOT/LICENSE" "$ROOT/LICENSE"
copy_if_missing "$REPO_ROOT/AUTHORSHIP.md" "$ROOT/AUTHORSHIP.md"
copy_if_missing "$REPO_ROOT/TOKEN_POLICY.md" "$ROOT/TOKEN_POLICY.md"
copy_if_missing "$REPO_ROOT/TERMS.md" "$ROOT/TERMS.md"
copy_if_missing "$REPO_ROOT/TRADEMARK_STRATEGY.md" "$ROOT/TRADEMARK_STRATEGY.md"
copy_if_missing "$REPO_ROOT/IP_ROADMAP.md" "$ROOT/IP_ROADMAP.md"
copy_if_missing "$REPO_ROOT/legal/KEY_IDENTITY_TEMPLATE.txt" "$ROOT/legal/KEY_IDENTITY_TEMPLATE.txt"

echo "[✓] Legal foundation initialized in: $ROOT"
