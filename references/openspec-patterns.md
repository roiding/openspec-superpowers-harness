# OpenSpec Patterns

Use this reference when translating a user request into durable planning artifacts.

## Core stance

- Fluid, not rigid
- Iterative, not waterfall
- Easy, not complex
- Brownfield-first

## Artifact stack

- `proposal.md`: why, scope, non-goals, impacted capabilities
- `specs/<capability>/spec.md`: behavior requirements and scenarios
- `design.md`: technical approach, major decisions, trade-offs
- `tasks.md`: implementation checklist

## Requirement intake checklist

Collect enough detail to answer:

1. What outcome does the user want?
2. Why now?
3. What is in scope and out of scope?
4. Which scenarios must succeed or fail explicitly?
5. What constraints or existing contracts must stay intact?

## Spec writing rules

- Write behavior, not implementation.
- Prefer observable outcomes over internal names.
- Turn each important behavior into a requirement plus concrete scenarios.
- Keep framework, library, and file-structure choices out of the spec unless they are externally visible constraints.

## Delta spec shape

Use change-oriented spec files for medium or large work:

```md
## ADDED Requirements

### Requirement: Example Behavior
The system MUST do something observable.

#### Scenario: Happy path
- GIVEN preconditions
- WHEN the action happens
- THEN the expected outcome occurs
```

Optional change sections:

- `## ADDED Requirements`
- `## MODIFIED Requirements`
- `## REMOVED Requirements`

## Persistence default

If the repo already has `openspec/`, use it.
Otherwise, create `openspec/changes/<change-name>/` only when the task is big enough to benefit from durable artifacts or the user asks for them.
