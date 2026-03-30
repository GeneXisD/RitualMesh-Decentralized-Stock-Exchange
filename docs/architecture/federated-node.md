# Federated Node Architecture

The system is designed as one authoritative federated node plus one secondary ClearingHouse-capable support host.

## Primary
The Intel-hosted Ubuntu 14.04 environment is the node of record.

## Secondary
The M4 host provides validation, comparison, sync, and future migration support.

## Design goal
Keep the primary environment stable and compatible while allowing the secondary host to evolve operational tooling around it.
