# RitualMesh repository layering

This repository is the main integration repo for the RitualMesh Decentralized Stock Exchange.

It should remain the canonical place for:

- architecture
- integration notes
- deployment plans
- orchestration logic
- validation and test plans
- legal and authorship mapping

It should not become a blind vendor dump of every external project.

## Layer model

### Layer 1: canonical node build
The current primary focus remains the Ubuntu 14.04 ClearingHouse federated node and the M4 secondary validation/orchestration host.

### Layer 2: integration surface
External projects should be treated as upstream dependencies or reference systems, not merged into core by copy-paste.

Recommended classes:

- Toolchain or substrate: `GeneXisD/ritualbrew-core`
- Traffic generation or network test: `USNavalResearchLaboratory/mgen`
- Tracking or estimation research: `USNavalResearchLaboratory/TrackerComponentLibrary`
- Design guidance and doctrine references: supporting research notes only

### Layer 3: local wrappers
Any code added here should be wrappers, adapters, scenarios, manifests, or notes that help RitualMesh consume the external systems.

## Directory intent

- `external/` = pointers, manifests, and import policy
- `integrations/` = wrappers, adapters, test scenarios, and bridge notes
- `research/doctrine/` = design summaries and architectural rationale
- `docs/architecture/` = how the full stack fits together

## Rules

1. Do not collapse all upstream code into this repo.
2. Keep canonical node build steps separate from experiments.
3. Add integration notes before adding new external dependencies.
4. Keep legal and licensing boundaries explicit.
5. Prefer a staged import plan over an all-at-once merge.
