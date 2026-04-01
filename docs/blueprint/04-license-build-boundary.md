# License and Build Boundary

## Purpose
Separate:
- upstream software
- build environments
- integration logic
- authorship and legal overlay

## Rule 1: Upstream Licenses Stay Intact
Original licenses remain with their original components.

Examples:
- Linux kernel -> GPLv2
- glibc / uClibc -> LGPL family
- OpenJDK -> GPLv2 with Classpath Exception where applicable
- Node-RED -> Apache 2.0
- Swift -> Apache 2.0
- libimobiledevice -> LGPL
- Dyne and Puredyne components -> component-specific open-source licenses

## Rule 2: Build Environment Is Not the Same as Runtime
Build systems, toolchains, and historical distributions must be tracked separately from runtime services and final deployment artifacts.

## Rule 3: RitualMesh Overlay Must Be Explicit
The integration layer, architecture, orchestration logic, and authorship material should be described as the RitualMesh overlay, not as a replacement for upstream ownership.

## Rule 4: Every Component Must Have a Role
Each major dependency should be tracked with:
- name
- license
- role
- source
- whether it is build-time, runtime, optional, or future

## Rule 5: Future Layers Must Be Marked Honestly
If a subsystem has not been source-verified yet, it must be marked as planned or pending verification.
