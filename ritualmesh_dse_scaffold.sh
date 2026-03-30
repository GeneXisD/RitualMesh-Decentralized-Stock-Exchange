#!/usr/bin/env bash
set -euo pipefail

# RitualMesh Decentralized Stock Exchange scaffold
# Creates a production-minded repo layout with starter docs, scripts, and placeholders.

REPO_NAME="RitualMesh-Decentralized-Stock-Exchange"
ROOT="${1:-$REPO_NAME}"

mkdir -p "$ROOT"
cd "$ROOT"

mkdir -p \
  .github/workflows \
  docs/architecture \
  docs/deployment \
  docs/security \
  docs/operations \
  docs/clearinghouse \
  docs/research \
  scripts/bootstrap \
  scripts/build \
  scripts/dev \
  scripts/vm \
  scripts/ops \
  configs/ubuntu14 \
  configs/docker \
  configs/examples \
  infra/utm \
  infra/vmware \
  infra/qemu \
  services/gateway-node \
  services/matching-node \
  services/settlement-node \
  services/audit-node \
  services/clearinghouse-node \
  libs/ritualkeys \
  libs/common \
  tests/smoke \
  tests/integration \
  assets/branding \
  runtime/logs \
  runtime/data \
  vendor

cat > .gitignore <<'EOF'
# macOS
.DS_Store

# env
.env
.env.*
*.local

# editors
.vscode/
.idea/

# runtime
runtime/logs/*
!runtime/logs/.gitkeep
runtime/data/*
!runtime/data/.gitkeep

# build
build/
dist/
*.qcow2
*.vmdk
*.iso
*.img
*.ova

# python/node generic
__pycache__/
node_modules/
.venv/
EOF

cat > README.md <<'EOF'
# RitualMesh Decentralized Stock Exchange

RitualMesh Decentralized Stock Exchange (R-DSE) is a modular, peer-to-peer exchange stack designed around distributed order propagation, matching, auditability, and optional clearinghouse settlement.

## Current focus
- Establish clean repository structure
- Stand up Ubuntu 14.04 build environment for legacy ClearingHouse work
- Separate modern mesh services from legacy dependencies
- Document architecture, security, and deployment from day one

## Repository map
- `docs/` architecture, security, deployment, operations, clearinghouse notes
- `scripts/` bootstrap, VM setup, builds, dev helpers, ops tasks
- `infra/` VM and emulator definitions for Apple Silicon and Intel Macs
- `services/` exchange node roles
- `libs/` shared code and cryptographic identity helpers
- `configs/` example configuration and legacy OS notes
- `tests/` smoke and integration checks

## Host strategy
- **Mac Pro M4 (Apple Silicon):** use UTM/QEMU for x86_64 Ubuntu 14.04 images when legacy x86 userspace is required
- **Intel Mac 2016:** use VMware Fusion for the most compatible Ubuntu 14.04 build VM

## First milestones
1. Create scaffold
2. Bring up Ubuntu 14.04 on Intel Mac
3. Snapshot working VM before package installs
4. Build legacy ClearingHouse dependencies
5. Keep mesh services isolated from legacy stack

## Status
Scaffold initialized.
EOF

cat > docs/PROJECT_STATUS.md <<'EOF'
# Project Status

## Phase 0 - Foundation
- [x] Repository created
- [x] Initial README present
- [x] Base scaffold defined
- [ ] Ubuntu 14.04 VM created on Intel Mac
- [ ] Ubuntu 14.04 x86_64 emulation path created on M4 Mac
- [ ] ClearingHouse prerequisites documented
- [ ] First service stub committed
EOF

cat > docs/ROADMAP.md <<'EOF'
# Roadmap

## Phase 0 - Bootstrap
- Repository scaffold
- Host strategy for Intel + Apple Silicon
- Legacy Ubuntu 14.04 environment

## Phase 1 - Clearinghouse Baseline
- Build legacy dependencies
- Capture patches and package versions
- Export reproducible VM notes

## Phase 2 - Core Mesh Roles
- Gateway node stub
- Matching node stub
- Settlement node stub
- Audit node stub
- Clearinghouse node stub

## Phase 3 - Integration
- Order flow simulation
- Signed trade lifecycle
- Local cluster smoke testing
EOF

cat > docs/architecture/README.md <<'EOF'
# Architecture

This folder contains the system design for R-DSE.

## Planned documents
- `nodes.md` node roles and responsibilities
- `trade-lifecycle.md` order-to-settlement flow
- `network-topology.md` mesh propagation model
- `trust-boundaries.md` keys, signatures, and validation zones
EOF

cat > docs/architecture/nodes.md <<'EOF'
# Node Roles

## Gateway Node
Validates identity, rate limits ingress, and propagates signed orders.

## Matching Node
Maintains local/off-chain books and proposes matches.

## Settlement Node
Finalizes matched trades and anchors settlement events.

## Audit Node
Replays and verifies state transitions independently.

## Clearinghouse Node
Optional netting, collateral, and reconciliation layer.
EOF

cat > docs/architecture/trade-lifecycle.md <<'EOF'
# Trade Lifecycle

1. Trader signs order
2. Gateway validates and propagates
3. Matching nodes discover compatible orders
4. Settlement nodes finalize execution
5. Audit nodes verify consistency
6. Clearinghouse nodes reconcile obligations where enabled
EOF

cat > docs/security/README.md <<'EOF'
# Security

Capture threat models, key management, trust boundaries, hardening steps, and audit procedures here.
EOF

cat > docs/security/threat-model.md <<'EOF'
# Threat Model

## In scope
- Order forgery
- Replay attacks
- Node impersonation
- Settlement tampering
- Key theft
- Malicious gateways

## Baseline controls
- Signed messages
- Nonces / timestamps
- Independent audit nodes
- Immutable logs / settlement anchors
- Host hardening and snapshots
EOF

cat > docs/deployment/README.md <<'EOF'
# Deployment

This folder tracks repeatable host setup steps for Intel Mac, Apple Silicon Mac, and future Linux servers.
EOF

cat > docs/deployment/host-matrix.md <<'EOF'
# Host Matrix

| Host | Best use | Recommended virtualization |
|---|---|---|
| Intel Mac 2016 | Primary Ubuntu 14.04 build host | VMware Fusion |
| Mac Pro M4 | Emulation, docs, modern services | UTM / QEMU |
EOF

cat > docs/clearinghouse/README.md <<'EOF'
# ClearingHouse Legacy Track

Use this area to document the exact legacy dependency chain, package versions, usernames, passwords, ports, and service relationships required by the original ClearingHouse stack.

## Important rule
Record every credential, port, and daemon role in one place to avoid mixed setups.
EOF

cat > docs/clearinghouse/build-notes.md <<'EOF'
# Build Notes

## Goals
- Reproduce a clean Ubuntu 14.04 environment
- Install dependencies one group at a time
- Snapshot after each stable milestone
- Record divergences from original manuals
EOF

cat > docs/operations/README.md <<'EOF'
# Operations

Runbooks, incident notes, backups, snapshots, and restoration procedures belong here.
EOF

cat > docs/research/README.md <<'EOF'
# Research

Store reference notes, protocol ideas, exchange mechanics, and compatibility findings here.
EOF

cat > scripts/bootstrap/init_repo.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "[+] Initializing git hooks placeholder and runtime dirs"
mkdir -p runtime/logs runtime/data
: > runtime/logs/.gitkeep
: > runtime/data/.gitkeep
chmod -R u+rwX scripts || true

echo "[+] Done"
EOF
chmod +x scripts/bootstrap/init_repo.sh

cat > scripts/vm/create_utm_placeholder.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "Create an x86_64 Ubuntu 14.04 VM in UTM on Apple Silicon."
echo "Recommended: 2 vCPU, 4 GB RAM, 40+ GB disk, x86_64 emulation, ISO from Ubuntu old releases."
EOF
chmod +x scripts/vm/create_utm_placeholder.sh

cat > scripts/vm/create_vmware_placeholder.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "Create Ubuntu 14.04 x86_64 VM in VMware Fusion on Intel Mac."
echo "Recommended: 2 vCPU, 4-8 GB RAM, 60 GB disk, take snapshot immediately after install."
EOF
chmod +x scripts/vm/create_vmware_placeholder.sh

cat > scripts/build/build_clearinghouse_placeholder.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "Placeholder for legacy ClearingHouse build sequence."
echo "Document exact package versions in docs/clearinghouse/build-notes.md before automating."
EOF
chmod +x scripts/build/build_clearinghouse_placeholder.sh

cat > scripts/dev/up.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "Developer up script placeholder"
EOF
chmod +x scripts/dev/up.sh

cat > scripts/ops/snapshot_checklist.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

cat <<MSG
Snapshot checklist:
1. Clean shutdown or consistent service state
2. Export package list
3. Save config diffs
4. Record active ports
5. Name snapshot with date + milestone
MSG
EOF
chmod +x scripts/ops/snapshot_checklist.sh

cat > services/README.md <<'EOF'
# Services

Each node role should be isolated so that legacy ClearingHouse work does not contaminate newer exchange services.
EOF

for svc in gateway-node matching-node settlement-node audit-node clearinghouse-node; do
  cat > "services/$svc/README.md" <<EOF
# ${svc}

Purpose: service stub for ${svc}.

## Planned responsibilities
- Define API / message contract
- Define configuration format
- Define runtime dependencies
- Add smoke test
EOF
done

cat > libs/README.md <<'EOF'
# Shared Libraries

Common helpers, cryptographic identity helpers, message schemas, and reusable logic.
EOF

cat > tests/README.md <<'EOF'
# Tests

Start with smoke tests that validate repo assumptions, config presence, and service wiring.
EOF

cat > .github/workflows/docs-check.yml <<'EOF'
name: docs-check

on:
  push:
  pull_request:

jobs:
  docs-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Verify key docs exist
        run: |
          test -f README.md
          test -f docs/PROJECT_STATUS.md
          test -f docs/ROADMAP.md
          test -f docs/clearinghouse/build-notes.md
EOF

: > runtime/logs/.gitkeep
: > runtime/data/.gitkeep

echo "[+] Scaffold created at: $(pwd)"
echo "[+] Next: run scripts/bootstrap/init_repo.sh"
