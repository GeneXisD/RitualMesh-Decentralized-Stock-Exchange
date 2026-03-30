# Snapshots

## Purpose
Preserve known-good recovery points before dependency or configuration changes.

## Recommended snapshot points
- `clean-install`
- `pre-clearinghouse-deps`
- `post-clearinghouse-base`
- `pre-counterparty`
- `pre-major-config-change`

## Rule
Never make a major dependency or service change without naming and recording a snapshot first.
