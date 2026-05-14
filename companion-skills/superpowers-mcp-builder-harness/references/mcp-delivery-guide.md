# MCP Delivery Guide

Use this reference when implementing MCP servers or extending their protocol surface.

## Core object types

- Tool: explicit invocation, often side effects
- Resource: read-oriented access to data
- Prompt: reusable interaction template

## Design rules

- prefer verb-first names for tools
- describe every parameter clearly
- give optional parameters sensible defaults
- return structured, readable output

## Failure handling

- catch external-call failures
- return actionable error messages
- distinguish validation, permissions, not-found, and service errors

## Testing ladder

1. unit test core logic
2. integration test protocol behavior
3. inspect manually when useful
4. verify the exact startup path users will run

## Security

- apply least privilege
- confirm dangerous actions explicitly
- keep secrets out of source
- constrain filesystem and shell surfaces
