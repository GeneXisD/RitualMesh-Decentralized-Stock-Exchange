# Trust Model

## Primary trust anchor
The Intel Ubuntu 14.04 primary is the node of record.

## Secondary trust posture
The M4 host observes, validates, and mirrors, but does not override the primary without documented failover.

## Mobile legacy trust posture
The Android legacy shell stack is a helper environment only.

## Principles
- minimize surprise
- document every change
- avoid dual-write ambiguity
- verify before promotion
