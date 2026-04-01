# Fractal Identity Model

## Purpose
Provide a deterministic identity and key hierarchy for:
- ledger cleanliness
- device identity consistency
- node trust structure
- service separation

## Rule
Do not invent a new cipher.
Use proven cryptographic primitives and apply a structured derivation model.

## Recommended Primitive Families
- Ed25519 for signatures
- X25519 for key exchange
- ChaCha20-Poly1305 or AES-GCM for authenticated encryption
- HKDF / BLAKE3 / SHA-256 family for derivation support, as appropriate to implementation

## Identity Hierarchy

Root Identity
- offline
- high-trust
- never exposed on normal nodes

Sub-roots
- Ledger Root
- Node Root
- Network Root

Node Layer
- Node A
- Node B
- Node C

Device Layer per Node
- Xbox key
- PlayStation key
- Router key
- Pi key
- BeagleBone key
- Arduino key

Service Layer
- ClearingHouse key
- sync / verify key
- API key
- monitoring key

Session Layer
- temporary transaction/session keys

## Benefit
This improves:
- identity consistency
- node verification
- cleaner ledger relationships
- easier rebuild and recovery
- role separation across devices and services

## Warning
If the root is compromised, everything derived from it is at risk.
Therefore:
- keep root offline
- isolate sub-roots
- do not reuse keys across roles
