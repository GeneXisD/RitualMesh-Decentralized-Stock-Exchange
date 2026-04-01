# Node Artifact Flow

## Node Cell
Node = Xbox (Dyne:bolic 1.x) + PlayStation (Puredyne) + Router

## Flow

### Step 1 - Xbox Bootstrap Stage
Xbox running Dyne:bolic 1.x:
- stages source inputs
- prepares initial artifacts
- establishes bootstrap environment assumptions

### Step 2 - Transfer Stage
Artifacts, source bundles, prepared files, or persistent directories are transferred into the PlayStation/Puredyne environment.

### Step 3 - PlayStation Persistent Stage
PlayStation running Puredyne:
- stores live-build state
- preserves reusable environment
- maintains the carry-forward working system
- becomes the repeatable persistent node-side build environment

### Step 4 - Router Boundary Stage
ASUS AC1900 router:
- links the node cell to adjacent nodes or gateways
- enforces transport boundary
- provides segmentation and route path for the node cell

### Step 5 - Network Participation
The node cell participates as part of the larger RitualMesh fabric while the canonical Ubuntu 14.04 federated node remains the authority for ledger and exchange state.

## Open Questions to Preserve
- exact Xbox boot path
- exact PlayStation boot path
- exact persistence directory / dyne folder handling
- exact Dyne 3 / Netsukuku integration path
