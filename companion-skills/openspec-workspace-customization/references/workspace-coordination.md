# Workspace Coordination

Use this reference when planning spans multiple repos or folders.

## Prefer a workspace when

- one feature touches multiple repos
- planning must refer to stable names like `api`, `web`, or `checkout`
- repo-local OpenSpec would fragment the change narrative

## Prefer repo-local OpenSpec when

- one repo owns planning and implementation
- cross-repo concerns are minor or downstream

## Important caution

OpenSpec workspace support is still evolving.
Treat it as a coordination surface, not a frozen automation contract.

## Core model

- workspace: planning home for related cross-repo work
- link: stable name for a repo or folder
- change: one feature, fix, or project within that planning surface
