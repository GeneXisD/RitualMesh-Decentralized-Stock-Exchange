#!/usr/bin/env bash
set -euo pipefail

echo "[+] Initializing git hooks placeholder and runtime dirs"
mkdir -p runtime/logs runtime/data
: > runtime/logs/.gitkeep
: > runtime/data/.gitkeep
chmod -R u+rwX scripts || true

echo "[+] Done"
