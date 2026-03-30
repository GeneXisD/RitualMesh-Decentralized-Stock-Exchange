# Repo Map

## Root
- `README.md` — project overview
- `FEDERATED_NODE.md` — authoritative topology statement
- `CLEARINGHOUSE_CLUSTER.md` — cluster model
- `REPO_MAP.md` — this file

## Docs
- `docs/PROJECT_STATUS.md` — current status snapshot
- `docs/ROADMAP.md` — phased plan
- `docs/architecture/` — system design and future extensions
- `docs/build/` — host-specific build notes
- `docs/ops/` — service map, startup order, replication, users, ports, snapshots
- `docs/security/` — trust and key notes
- `docs/research/` — reference notes and questions

## Hosts
- `hosts/intel-primary/` — primary host notes and scripts
- `hosts/m4-secondary/` — secondary host notes and scripts
- `hosts/android-legacy/` — legacy mobile shell node notes

## Node roles
- `node/federated-primary/`
- `node/clearinghouse-primary/`
- `node/clearinghouse-secondary/`
- `node/counterparty/`
- `node/bridge/`
- `node/audit/`
- `node/mobile-legacy/`

## Scripts
- `scripts/bootstrap/` — repo bootstrap helpers
- `scripts/build/` — build helpers
- `scripts/sync/` — config/state synchronization
- `scripts/start/` — start helpers
- `scripts/stop/` — stop helpers
- `scripts/verify/` — verification and comparison helpers
- `scripts/vm/` — VM setup helpers

## Services
- `services/clearinghouse/`
- `services/counterparty/`
- `services/federator/`
- `services/bridge/`
- `services/audit/`
- `services/mobile-shell/`
- `services/liquidity-node/`
