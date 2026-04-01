# LICENSE MAP

This file is a working map and should be refined as source verification continues.

| Component | License Family / Known License | Role | Status |
|---|---|---|---|
| Linux kernel | GPLv2 | core OS / runtime kernel | verify exact version path |
| glibc | LGPL | core runtime library | verify exact version path |
| uClibc | LGPL | alternate lightweight runtime library | verify exact version path |
| OpenJDK / Babylon-related components | GPLv2 + Classpath Exception where applicable | language/runtime research layer | verify exact component usage |
| Node-RED | Apache 2.0 | orchestration / automation | verify exact integration |
| Swift | Apache 2.0 | Apple-related development layer | verify exact integration |
| libimobiledevice | LGPL | Apple device integration | verify exact integration |
| Dyne:bolic components | mixed open-source / GPL-family by component | historical build lineage | verify per component |
| Puredyne components | mixed open-source by component | persistent live build environment | verify per component |
| GNUnet | GPL-family / component-specific | distributed communication layer | verify exact package usage |
| Netsukuku-related code | component-specific / verify from source | mesh integration path | pending verification |
| RitualMesh authored overlay | user-authored | integration, architecture, orchestration, docs | define exact project license |

## Notes
1. Original upstream licenses remain intact.
2. RitualMesh overlay documents should clearly separate authored integration work from upstream components.
3. No upstream license should be replaced or relicensed by the overlay.
