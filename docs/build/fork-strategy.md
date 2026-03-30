# Fork Strategy

## Rule
Do not depend operationally on an upstream repository without maintaining a controlled fork when project-specific hooks, patches, or reproducibility matter.

## Recommended remote model
- `origin` = your fork
- `upstream` = source project
- local working branch = project-specific build branch

## Why
- protects your build flow
- allows hooks and patches
- keeps upstream comparison clean
