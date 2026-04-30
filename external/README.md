# External dependencies

This directory defines how external repositories are used.

We do not copy entire upstream projects into this repo.

Instead we:

- reference upstream repositories
- optionally use git submodules
- document how they are used

## Planned externals

- ritualbrew-core (toolchain)
- mgen (traffic generation)
- tracker component library (research)

## Rule

If a dependency is added here, it must have a corresponding integration entry in `integrations/`.
