# Edge Layer Model

## Purpose
Integrate supporting embedded hardware into the broader RitualMesh ecosystem without changing the canonical node definition.

## Edge Devices

### BeagleBone Black
Role:
- deterministic hardware control
- industrial I/O
- hardware state monitoring
- secure physical signaling

### Raspberry Pi
Role:
- lightweight Linux service node
- local API / monitoring
- bridge services
- Node-RED or other orchestrated edge support

### Arduino
Role:
- simple hardware triggers
- watchdog / reset signaling
- physical event capture
- low-level signaling path

## Placement
The edge layer supports:
- node cells
- canonical node monitoring
- mobile or local control
- environmental or hardware-linked actions

## Identity Note
Each edge device should have a role-specific derived identity, not a reused general key.
