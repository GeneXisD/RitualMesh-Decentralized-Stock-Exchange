# ClearingHouse Cluster

## Topology
- Intel Mac + Ubuntu 14.04 = primary federated node
- M4 Mac = secondary ClearingHouse support host

## Intent
This layout separates:
- authoritative network-facing execution
- support, comparison, synchronization, and recovery

## Cluster rules
1. Write operations target the primary federated stack unless failover is declared.
2. Secondary services must not advertise themselves as the public node.
3. Ports, users, paths, and startup order must remain documented in `docs/ops/`.
4. Sync and verification must live in `scripts/sync/` and `scripts/verify/`.
