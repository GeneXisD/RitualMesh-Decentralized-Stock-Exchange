# Service Map

## RitualMesh DSE dual-host service map

### Primary
- Host: Intel Mac
- Guest: Ubuntu 14.04.6
- Role: primary federated node
- Authority: canonical

### Secondary
- Host: M4 Mac
- Role: secondary ClearingHouse support host
- Authority: non-canonical unless promoted

### Mobile legacy
- Host: Android legacy shell stack
- Role: helper/control shell node
- Authority: non-canonical

## Ownership table

| Service / Role | Intel Ubuntu 14.04 | M4 Mac | Android Legacy | Notes |
|---|---|---|---|---|
| Federated node identity | Primary | No | No | Intel is authoritative |
| ClearingHouse primary | Primary | Secondary / mirror | No | Intel is canonical |
| Counterparty interaction | Primary | Validation only | No | Keep Intel authoritative |
| Wallet/backend binding | Primary | Optional tools | No | Avoid accidental dual-writes |
| Audit / verification | Optional | Primary | No | Best fit on M4 |
| Reverse-repo support | Optional bridge | Primary support | No | Design layer only |
| Config archive / snapshots | Primary source | Secondary copy | No | Keep both sides documented |
| Mobile control shell | No | Optional remote admin | Primary role | helper surface only |

## Rule
Both hosts may run ClearingHouse-capable components, but only the Ubuntu 14.04 primary is the canonical federated node.
