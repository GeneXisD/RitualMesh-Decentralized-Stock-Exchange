# RitualMesh System

## System overview
RitualMesh DSE is a heterogeneous financial infrastructure design that combines:
- a canonical ClearingHouse-based federated node
- a secondary validation and synchronization host
- optional mobile legacy shell tooling
- a future liquidity and market-interface extension layer

## Layer model

### Layer 0 — Hosts
- Intel host running Ubuntu 14.04 = canonical node host
- M4 Mac = validation, sync, continuity, orchestration
- Android legacy environment = portable helper/control shell

### Layer 1 — Transport / chain
- current focus: ClearingHouse-compatible blockchain transport and transaction tagging
- chain-specific decisions remain documented separately from the node bring-up

### Layer 2 — Financial execution
- ClearingHouse primary
- counterparty interaction
- canonical write path on the Intel primary

### Layer 3 — Identity and protocol tagging
- protocol-level identifiers and future message-tag design space
- treated as a system design area, not required for primary bring-up

### Layer 4 — Coordination
- sync
- verify
- compare
- mirror
- eventual failover control

### Layer 5 — Extensions
- reverse-repo style liquidity logic
- market bridge design
- mobile shell node integration
- future multi-ledger bridge concepts

## Principle
The project should hold the whole long-term design while implementing only what is necessary for each phase.
