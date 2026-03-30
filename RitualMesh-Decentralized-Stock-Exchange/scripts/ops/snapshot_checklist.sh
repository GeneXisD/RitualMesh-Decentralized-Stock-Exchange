#!/usr/bin/env bash
set -euo pipefail

cat <<MSG
Snapshot checklist:
1. Clean shutdown or consistent service state
2. Export package list
3. Save config diffs
4. Record active ports
5. Name snapshot with date + milestone
MSG
