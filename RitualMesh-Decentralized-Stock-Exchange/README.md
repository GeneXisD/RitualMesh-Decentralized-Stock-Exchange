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
