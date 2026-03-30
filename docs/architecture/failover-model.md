# Failover Model

## Default state
Intel Ubuntu 14.04 remains authoritative.

## Secondary role during normal operations
M4 validates and mirrors state without becoming the public node.

## Promotion conditions
Before promoting the secondary host:
1. update `docs/ops/service-map.md`
2. update ports, paths, and users
3. update public endpoint references
4. document failover start time and reason
