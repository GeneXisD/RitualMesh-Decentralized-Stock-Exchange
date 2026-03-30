# Ubuntu 14.04 Primary Build

## Purpose
Build the authoritative federated node on the Intel host.

## Initial choices
- use entire disk
- do not encrypt home
- do not use Landscape
- software selection: standard system utilities only

## Recommended identity
- username: `clearinghouse`
- hostname: `ritualmesh-primary`

## Immediate post-install
1. take a snapshot named `clean-install`
2. record users, passwords, ports, and paths
3. install only required dependencies
4. keep build notes in `docs/build/clearinghouse-build-log.md`
