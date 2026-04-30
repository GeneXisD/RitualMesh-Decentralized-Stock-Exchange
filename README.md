# RitualMesh Decentralized Stock Exchange

RitualMesh DSE is a dual-host, heterogeneous, decentralized financial infrastructure project centered on a canonical ClearingHouse-based federated node and a secondary validation, synchronization, and orchestration host.

---

## Current architecture

- **Intel host + Ubuntu 14.04** = authoritative federated node  
- **M4 Mac** = secondary ClearingHouse-capable support host  
- **Android legacy shell stack** = optional mobile control / helper node  

---

## Core design

RitualMesh is evolving into a **multi-layer decentralized system** composed of:

### 1. Federated ClearingHouse Core (Canonical Layer)
- Primary execution node (Intel Ubuntu 14.04)
- Defines canonical transaction truth
- Maintains authoritative state

### 2. Validation & Synchronization Layer
- M4 secondary host
- Mirrors and verifies state
- Prepares failover continuity

### 3. Swarm Execution Layer (NEW)
- Nodes operate with local awareness
- Neighbor-based state validation
- Adaptive behavior under partial failure

### 4. Mesh Network Layer (NEW)
- Overlay network (10.x address space)
- Independent from control plane (192.168.x)
- Future integration with Netsukuku-style routing

### 5. Agent / Intent Layer (NEW)
- Translates user/system intent into execution
- Coordinates tasks across nodes
- Enables semi-autonomous operation

---

## Immediate priority

1. bring up the canonical ClearingHouse federated node on Ubuntu 14.04  
2. record all users, ports, paths, snapshots, and manual edits  
3. compare and mirror from the M4 secondary host  
4. stabilize the primary build before implementing deeper extensions  

---

## Principle

The primary node determines canonical truth.  
The secondary host protects continuity and validates state.  

The swarm layer distributes execution across nodes.  
The mesh layer enables resilient, decentralized communication.  
The agent layer translates intent into coordinated system behavior.  

Together, these layers form a **distributed, self-organizing infrastructure**.

---

## System Layers Overview

| Layer | Function |
|------|--------|
| ClearingHouse Core | Canonical financial execution |
| Validation Layer | State verification and redundancy |
| Swarm Layer | Distributed node behavior |
| Mesh Layer | Decentralized communication |
| Agent Layer | Intent-driven orchestration |

---

## Control vs Execution Model

RitualMesh follows a hybrid model:

- **Centralized control** (intent, coordination)  
- **Decentralized execution** (node-level behavior)  

This enables:

- resilience under node failure  
- scalable system expansion  
- future autonomous adaptation  

---