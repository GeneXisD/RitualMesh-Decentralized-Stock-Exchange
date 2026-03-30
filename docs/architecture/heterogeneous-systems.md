# Heterogeneous Systems

## Core idea
Some parts of the project only operate correctly in historically compatible environments, while newer hosts are better suited for coordination, verification, and future evolution.

## Examples in this project
- Ubuntu 14.04 as a legacy-compatible host for the canonical ClearingHouse build
- M4 macOS host as a modern validation and orchestration environment
- Android 4.4.4-era shell tooling as a portable legacy helper node

## Rule
Use older environments for compatibility-sensitive execution and newer environments for control, sync, and validation where that separation reduces risk.
