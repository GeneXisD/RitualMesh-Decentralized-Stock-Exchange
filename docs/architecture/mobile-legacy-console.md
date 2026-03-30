# Mobile Legacy Console

## Purpose
Document the Android-side legacy shell stack as a helper/control node, not as the canonical financial core.

## Stack
- Android legacy runtime
- Terminal IDE / KBOX-style userland shell environment
- ZShaolin as the higher command interface
- Dropbear / SSH access
- optional modular behavior through legacy `.dyne` concepts where applicable

## Role
- portable command node
- remote shell endpoint
- helper environment for scripts and control workflows
- non-canonical support path

## Rule
Do not assign canonical federated identity or primary settlement authority to the mobile legacy console.
