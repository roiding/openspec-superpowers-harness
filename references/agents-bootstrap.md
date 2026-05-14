# AGENTS Bootstrap

Use this reference when a project repo is missing `AGENTS.md` or the existing file is too thin to guide agent work reliably.

## Why create it early

`AGENTS.md` is the local operating contract.
It should exist before larger implementation starts whenever the repo has ongoing project work.

## What the first version should cover

Keep the first version short and durable.
Prefer rules that remain useful across many tasks:

- repo purpose
- source of truth locations
- preferred directory layout
- implementation rules
- testing and verification expectations
- dependency discipline
- documentation update expectations
- definition of done

## What to avoid

Do not turn `AGENTS.md` into:

- a giant onboarding manual
- chat transcript residue
- one-off task notes
- speculative architecture plans

## Suggested order in a fresh repo

1. Create `AGENTS.md`
2. Create or refresh `README.md`
3. Create OpenSpec change artifacts for the first real feature or refactor

## Update trigger

Refresh `AGENTS.md` when:

- the team adopts new durable workflows
- validation commands change
- project structure changes materially
- repeated agent mistakes suggest missing guardrails
