#!/usr/bin/env bash
set -euo pipefail
mkdir -p runtime/logs runtime/state runtime/exports
touch runtime/logs/.gitkeep runtime/state/.gitkeep runtime/exports/.gitkeep
echo "[+] runtime directories ready"
