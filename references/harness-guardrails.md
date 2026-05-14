# Harness Guardrails

Use this reference to keep agent-driven development controlled and durable.

## Core rules

- The repo is the source of truth.
- Important decisions belong in versioned files, not only in chat.
- `AGENTS.md` should be a map, not a giant tutorial.
- Prefer mechanical enforcement over verbal agreements.
- Optimize for agent readability: clear structure, explicit names, predictable placement.

## Delivery boundaries

- Make the smallest viable change.
- Do not mix unrelated refactors into functional work unless the user asks.
- Do not add speculative abstractions.
- Do not silently ignore failing checks.
- Update stale docs when the code changes invalidate them.

## Validation preference

Prefer evidence in this order:

1. tests
2. lint and type checks
3. build verification
4. focused manual validation when automation does not exist

## Entropy control

Watch for these failure modes in AI-assisted code:

- duplicated logic
- stale docs
- file sprawl
- weak naming
- unverified assumptions

If you notice them, either fix them within scope or call them out explicitly as residual risk.
