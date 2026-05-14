---
name: superpowers-mcp-builder-harness
description: Use when Codex needs to design, implement, test, or harden a Model Context Protocol server and should apply the superpowers MCP builder methodology together with harness-style validation, repo guardrails, and evidence-first delivery.
---

# Superpowers MCP Builder Harness

## Overview

Build MCP servers with stronger delivery discipline than a plain implementation prompt.
Use this when the project involves MCP tools, resources, prompts, protocol-safe debugging, testing, and release readiness.

## Workflow

### 1. Choose the right MCP primitive

Decide whether the capability should be a:

- Tool
- Resource
- Prompt

Do not model a read-only data fetch as a tool unless side effects or explicit invocation semantics require it.

### 2. Design the contract before implementation

Before coding, define:

- names
- parameter schemas
- descriptions
- return shape
- error behavior
- security boundaries

### 3. Implement with validation first

During implementation:

- validate input explicitly
- keep protocol handling robust
- isolate business logic from registration code
- avoid side-channel logging that can corrupt stdio

### 4. Test at multiple levels

Run:

- unit tests for core logic
- integration tests for MCP interactions
- manual inspection when needed with inspector-style tooling or equivalent

### 5. Verify before release

Before saying it is ready:

- verify behavior under success and failure paths
- verify security assumptions
- verify startup and shutdown behavior
- verify configuration and deployment examples

## Guardrails

- Do not use `console.log` on stdio protocol paths.
- Do not ship vague tool descriptions or underspecified schemas.
- Do not skip integration testing just because unit tests pass.
- Treat dangerous operations as explicit, constrained, and auditable.

## Reference Map

- Read `references/mcp-delivery-guide.md` for protocol-specific design and testing rules.
