# DECnet / FreakNet to RitualMesh Federated Node Mapping

## Purpose
This document captures the practical architectural lessons drawn from live DECnet / FreakNet systems and maps them to the RitualMesh Decentralized Stock Exchange project.

The goal is not to imitate legacy systems blindly. The goal is to identify the stable design patterns that already worked in historical distributed systems and reinterpret them for a modern, legally compliant, heterogeneous, dual-host financial infrastructure.

## What was observed
From the live OpenVMS / DECnet environment:

- a network may consist of multiple independent nodes with distinct roles
- a user identity can move between nodes through trusted proxy relationships
- nodes remain useful even when idle or sparsely populated
- services are exposed per node rather than through a single monolith
- the network survives because node responsibilities are clear

These are not just museum details. They are direct design signals.

## Mapping table

| Historical pattern | RitualMesh interpretation |
|---|---|
| DECnet node | Federated node role |
| Proxy access across nodes | controlled trust + credential portability |
| node-local state | host-local canonical service state |
| remote `SET HOST` style traversal | orchestration-driven cross-host operations |
| service list per machine | declared service inventory per host |
| independent operating systems | heterogeneous host strategy |

## RitualMesh project translation

### 1. Canonical truth stays on the primary node
The Intel Ubuntu 14.04 federated host remains the authoritative ClearingHouse execution environment.

Reason:
- the original ClearingHouse stack was designed around that environment
- historical compatibility matters more than convenience at this phase
- reproducibility is easier when there is one canonical runtime

### 2. The M4 host is not a replacement
The Apple Silicon M4 host should be treated as:
- a verification host
- a synchronization host
- a monitoring and orchestration host
- a documentation and artifact preservation host
- a future failover research host

This matches the historical lesson that not every node must perform the same role.

### 3. Identity and trust should be portable, not ambiguous
DECnet proxy access shows the value of moving identity through trusted relationships.

RitualMesh should apply that lesson carefully:
- host identities must be explicit
- keys and service trust must be documented
- synchronization must verify origin before accepting state
- no silent drift between hosts

### 4. Service declaration matters
Every host should maintain a machine-readable declaration of:
- hostname
- role
- operating system
- expected ports
- expected services
- data directories
- sync policy
- verification policy

This makes the network auditable and reduces future confusion.

## Recommended host roles

### Primary federated node
- ClearingHouse services
- canonical wallet / chain / database state
- historical environment lock
- baseline port inventory

### Secondary M4 host
- integrity checks
- config snapshot storage
- state hash comparison
- orchestration scripts
- documentation generation
- future compatibility experiments

### Optional mobile helper node
- read-only monitoring
- emergency status visibility
- scripted operator tasks
- future command relay

## Immediate implementation outcome
The project should reserve and maintain these directories:

- `scripts/sync/`
- `scripts/verify/`
- `docs/architecture/`
- `docs/runbooks/`
- `state/manifest/`

## Guardrail
RitualMesh must not collapse into a vague cluster concept. The project needs explicit role separation:

- primary node = execution authority
- secondary node = verification and continuity
- optional helpers = observation and orchestration

## Why this matters
The DECnet / FreakNet lesson is simple:

A real distributed network does not begin with infinite automation. It begins with clearly separated nodes, stable trust relationships, and understandable movement between roles.

That is the correct foundation for the RitualMesh Decentralized Stock Exchange.