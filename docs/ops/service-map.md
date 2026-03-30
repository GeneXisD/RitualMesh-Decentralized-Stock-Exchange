# `docs/ops/service-map.md`

## RitualMesh DSE dual-host service map

This project uses a **dual-host ClearingHouse layout**:

- **Intel Mac + Ubuntu 14.04 VM** = authoritative **federated node**
- **M4 Mac** = secondary **ClearingHouse support / validation / control host**

Both hosts may run ClearingHouse-capable components, but only the Ubuntu 14.04 environment is the canonical federated node identity.

---

## 1) Host roles

### Host A — Intel Mac (primary)
- **Physical host:** Intel MacBook Pro / Intel Mac 2016
- **Guest OS:** Ubuntu 14.04.6 LTS (Trusty Tahr) x86_64
- **Role:** primary federated node
- **Authority level:** canonical network-facing execution host

### Host B — MacBook Pro M4 (secondary)
- **Physical host:** Apple Silicon M4 MacBook Pro
- **Host OS:** macOS
- **Role:** secondary ClearingHouse host
- **Authority level:** non-federated support, control, verification, reverse-repo support

---

## 2) Operational truth

### Federated context
This is the configuration that other network participants should treat as authoritative.

**Runs on:** Intel Mac → Ubuntu 14.04 VM

Responsibilities:
- federated node identity
- canonical ClearingHouse execution
- canonical counterparty interaction
- primary wallet/backend linkage
- network-facing ports
- legacy dependency compatibility

### Secondary context
This is the internal support and validation layer.

**Runs on:** M4 Mac

Responsibilities:
- secondary ClearingHouse-compatible environment
- config mirror
- audit / verification
- reverse-repo support
- migration and recovery assistance
- future orchestration and sync tooling

---

## 3) Service ownership table

| Service / Role | Intel Ubuntu 14.04 VM | M4 Mac | Notes |
|---|---|---|---|
| Federated node identity | Primary | No | Only the Ubuntu 14.04 VM represents the node on the network |
| ClearingHouse primary | Primary | Secondary / mirror | Intel is canonical |
| Counterparty interaction | Primary | Optional validation | Keep Intel authoritative |
| Wallet/backend binding | Primary | Optional observer tools | Prevent accidental dual-writes |
| Audit / verification | Optional | Primary | Better fit on M4 |
| Reverse-repo support | Optional bridge | Primary support | M4 can assist without becoming the federated identity |
| Config archive / snapshots | Primary source | Secondary copy | Keep both sides documented |
| Recovery / migration | Backup target | Primary planning host | M4 helps preserve continuity |

---

## 4) Port plan

> Replace the placeholders below with the real ports once the stack is confirmed.

### Intel primary (canonical ports)
- `CH_API_PORT=<set-me>`
- `CH_RPC_PORT=<set-me>`
- `CP_API_PORT=<set-me>`
- `WALLET_RPC_PORT=<set-me>`

### M4 secondary (non-canonical mirror ports)
- `CH_API_PORT=<set-me>`
- `CH_RPC_PORT=<set-me>`
- `CP_API_PORT=<set-me>`
- `WALLET_RPC_PORT=<set-me>`

### Rule
The M4 host should **not** expose or advertise itself as the federated endpoint unless you intentionally promote it.

---

## 5) Identity and credential map

### Intel primary
- **System user:** `<set-me>`
- **VM hostname:** `<set-me>`
- **Wallet user:** `<set-me>`
- **Service owner:** `<set-me>`

### M4 secondary
- **System user:** `<set-me>`
- **Hostname:** `<set-me>`
- **Service owner:** `<set-me>`

### Rule
Do not reuse credentials blindly across both contexts without documenting why.

---

## 6) Startup order

1. Start Intel Mac host
2. Start Ubuntu 14.04 VM
3. Start wallet/backend dependencies
4. Start primary ClearingHouse services
5. Verify primary federated node health
6. Start M4 support services
7. Start M4 validation / mirror services
8. Run comparison / verification checks

---

## 7) State handling

### Authoritative state
- Intel Ubuntu 14.04 VM

### Secondary state
- M4 validation / mirrored state

### Rule
Write operations should target the authoritative Intel federated stack unless a documented failover procedure says otherwise.

---

## 8) Future sync area

This repository should include a future `scripts/sync/` directory for:

- `sync-config.sh`
- `pull-state-from-primary.sh`
- `compare-clearinghouse-state.sh`
- `check-port-alignment.sh`
- `verify-service-map.sh`

That area is intentionally reserved for dual-host alignment work.

---

## 9) Failover note

The M4 host is a **secondary support host**, not the federated node by default.

If you ever promote it, update:
- this file
- all port docs
- startup order docs
- host role docs
- public node identity references

---

## 10) Current decision statement

> RitualMesh DSE operates a dual-host ClearingHouse architecture in which both hosts may run ClearingHouse-capable components, while the Intel-hosted Ubuntu 14.04 environment serves as the authoritative federated node.
