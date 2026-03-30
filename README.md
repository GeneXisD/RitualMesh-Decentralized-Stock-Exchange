# RitualMesh Decentralized Stock Exchange

RitualMesh DSE is a dual-host, heterogeneous, decentralized financial infrastructure project centered on a canonical ClearingHouse-based federated node and a secondary validation, synchronization, and orchestration host.

## Current architecture
- **Intel host + Ubuntu 14.04** = authoritative federated node
- **M4 Mac** = secondary ClearingHouse-capable support host
- **Android legacy shell stack** = optional mobile control / helper node

## Core design
- canonical primary execution on the Intel-hosted Ubuntu 14.04 environment
- secondary validation, synchronization, and future failover support on the M4
- reserved `scripts/sync/` and `scripts/verify/` foundations for dual-host coordination
- future liquidity / reverse-repo style design space documented as an extension layer
- future bridge and market-interface architecture documented separately from the core node bring-up

## Immediate priority
1. bring up the canonical ClearingHouse federated node on Ubuntu 14.04
2. record all users, ports, paths, snapshots, and manual edits
3. compare and mirror from the M4 secondary host
4. stabilize the primary build before implementing deeper extensions

## Principle
The primary node determines canonical truth. The secondary host protects continuity, validates state, and prepares future orchestration.
