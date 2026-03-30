# Federated Node

RitualMesh DSE uses a dual-host ClearingHouse architecture.

## Authoritative node
The authoritative federated node is the **Intel-hosted Ubuntu 14.04 environment**.

This environment is responsible for:
- federated node identity
- canonical ClearingHouse execution
- canonical counterparty interaction
- primary wallet/backend linkage
- network-facing ports
- legacy compatibility

## Secondary host
The **M4 Mac** is a secondary ClearingHouse-capable host.

This host is responsible for:
- validation
- audit support
- config mirroring
- reverse-repo support
- migration planning
- future orchestration and sync tooling

## Rule
Both hosts may run ClearingHouse-capable components, but only the Ubuntu 14.04 environment is the canonical federated node unless a documented failover procedure promotes the secondary host.
