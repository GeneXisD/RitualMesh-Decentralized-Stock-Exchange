# Sync + Verify System (Dual-Host)

Primary (Intel Ubuntu 14.04) = canonical node
Secondary (M4 Mac) = snapshot + verification

## Usage

1. Pull:
PRIMARY_HOST=192.168.0.17 ./scripts/sync/pull_primary_state.sh

2. Verify:
./scripts/verify/compare_latest.sh

## Output
state/snapshots/<timestamp>/

## Principle
Secondary never overwrites primary. It verifies and records.