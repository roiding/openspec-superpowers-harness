---
name: openspec-workspace-customization
description: Use when Codex needs OpenSpec capabilities that are intentionally not bundled into the main project-delivery skill, especially multi-repo workspace planning, linked-repo coordination, custom schema design, project config tuning, or mapping OpenSpec delivery to specific AI tool integrations.
---

# OpenSpec Workspace Customization

## Overview

Handle the OpenSpec features that are broader than day-to-day feature delivery.
Use this companion when planning spans multiple repos, when the OpenSpec workflow itself needs customization, or when tool-specific delivery behavior matters.

## Capabilities

### 1. Workspace coordination

Use for:

- planning that spans multiple repos or folders
- deciding whether to use repo-local OpenSpec or a workspace
- coordinating linked repos before implementation begins

### 2. Schema and config customization

Use for:

- changing artifact dependencies
- adding or removing workflow artifacts
- tuning `openspec/config.yaml`
- building project-local custom schemas

### 3. Tool and delivery mapping

Use for:

- deciding how OpenSpec should surface in Codex or other AI tools
- understanding skills vs commands delivery
- adapting OpenSpec workflow concepts without pretending unsupported runtime features exist

## Workflow

1. Determine whether the need is:
   - workspace coordination
   - schema/config customization
   - tool delivery mapping
2. Inspect the current repo or workspace shape before proposing changes.
3. Keep the solution as local as possible:
   - repo config before global override
   - project schema before broad platform abstraction
   - clear linked-repo planning before implementation
4. Persist durable decisions in versioned files when they affect future work.

## Guardrails

- Do not pretend beta or tool-specific behavior is more stable than it is.
- Distinguish clearly between OpenSpec concepts and CLI/runtime features.
- Prefer project-local customization before global customization.
- When coordinating multiple repos, keep planning and implementation concerns separate.

## Reference Map

- Read `references/workspace-coordination.md` for linked-repo and workspace guidance.
- Read `references/schema-customization.md` for config and custom schema patterns.
- Read `references/tool-delivery-mapping.md` for supported-tools and delivery adaptation.
