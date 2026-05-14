---
name: openspec-superpowers-harness
description: Use when Codex is asked to build, extend, refactor, or debug a software project and should first clarify requirements in an OpenSpec-style flow before coding, then implement with Superpowers disciplines such as explicit planning, TDD, systematic verification, and optional delegation only when higher-priority instructions allow it, while keeping Harness Engineering guardrails around scope, repo truth, and mechanical validation. Default to Chinese collaboration unless higher-priority instructions, explicit user preference, or strong repo conventions call for another language.
---

# OpenSpec Superpowers Harness

## Overview

Run spec-first project delivery.
Clarify the request in an OpenSpec style, translate it into proposal/spec/design/tasks, then implement with Superpowers habits under Harness Engineering guardrails.

Respect higher-priority instructions and platform limits.
If a system, developer, or user instruction forbids subagents, branch changes, or other actions, adapt the workflow instead of forcing the original OpenSpec or Superpowers behavior.

## Language Mode

Default to Chinese for:

- requirement questions
- scope confirmation
- spec and plan summaries shown in chat
- implementation progress updates
- verification summaries
- final delivery notes

Switch to English only when one of these is true:

- the user explicitly asks for English
- higher-priority instructions require English
- the repo's durable docs and team conventions are clearly English-first
- an external interface, API contract, or artifact must remain in English

When the repo is mixed-language, use this split:

- chat communication: Chinese by default
- code, identifiers, commit style, and repo docs: follow existing repo conventions
- OpenSpec artifacts written into the repo: follow the dominant project language, and ask only if the choice has long-term impact and is genuinely unclear

## Workflow Modes

This skill supports two operating modes.

### Core Mode

Use this as the default path unless the task clearly benefits from the fuller matrix.

Core mode keeps the flow compact:

1. establish or read `AGENTS.md`
2. clarify the request
3. summarize or write `proposal/spec/design/tasks` at the lightest useful level
4. implement
5. verify
6. sync docs and close out

This is the right default for:

- small to medium features
- straightforward refactors
- contained bug fixes
- projects where the user wants velocity without extra ceremony

### Full Mode

Use this when the task needs richer routing across multiple workflows from OpenSpec and Superpowers.

Full mode means you deliberately choose among:

- OpenSpec `core` path vs expanded path
- brainstorming vs direct intake
- incremental artifact creation vs fast-forward artifact creation
- inline execution vs plan-driven execution
- debugging-first vs implementation-first
- optional review and branch-finishing flows

Do not imitate slash commands literally unless the environment supports them.
Instead, emulate the workflow intent in Codex.

## Full-Mode Router

Choose the route based on the work shape.

### Route A: exploratory or ambiguous work

Use when requirements are unclear, trade-offs are substantial, or the user is still shaping the idea.

Equivalent source workflows:

- OpenSpec: `explore`
- superpowers: `brainstorming`

What to do:

1. inspect repo and current constraints
2. ask one focused question at a time
3. compare 2-3 viable options with a recommendation
4. confirm the chosen direction
5. then move into artifact creation

### Route B: quick feature path

Use when scope is already clear and the change is small or medium.

Equivalent source workflows:

- OpenSpec `core`: `propose -> apply -> sync -> archive`
- OpenSpec expanded shortcut: `new -> ff -> apply -> verify -> archive`

What to do:

1. establish repo guardrails
2. produce compact `proposal/spec/design/tasks`
3. implement directly
4. verify against the artifacts
5. update durable docs if needed

### Route C: controlled artifact-by-artifact path

Use when the user wants to inspect planning quality, or when risk is high enough that each artifact should be reviewed before moving on.

Equivalent source workflows:

- OpenSpec expanded: `new -> continue -> continue -> ... -> apply -> verify -> archive`
- superpowers: `writing-plans`

What to do:

1. create the change scaffold or equivalent structure
2. build `proposal`
3. build `spec`
4. build `design`
5. build `tasks`
6. only then implement

This is the best path for:

- larger features
- integration-heavy work
- changes with meaningful external contracts
- migrations
- security, reliability, or performance-sensitive work

### Route D: plan-driven implementation path

Use when there is already a written plan or when the implementation is large enough to benefit from explicit execution checkpoints.

Equivalent source workflows:

- superpowers: `executing-plans`
- superpowers: `subagent-driven-development` when explicitly allowed by higher-priority instructions or the user

What to do:

1. read the plan critically before coding
2. check for missing dependencies, weak validation, or hidden assumptions
3. execute task by task
4. verify at each meaningful checkpoint
5. finish with a branch or delivery close-out flow

If delegation is not explicitly allowed, keep this route inline and preserve the same discipline.

### Route E: debugging-first path

Use for bugs, flaky tests, regressions, failing builds, and unexpected runtime behavior.

Equivalent source workflows:

- OpenSpec: `explore` when root cause is unknown
- superpowers: `systematic-debugging`

What to do:

1. reproduce the issue
2. inspect the error and recent changes
3. isolate the root cause
4. only then propose or implement a fix
5. add regression coverage
6. verify the original symptom is gone

Never jump straight from symptom to fix.

### Route F: review and close-out path

Use after important checkpoints, before merge, or when the user asks for extra confidence.

Equivalent source workflows:

- OpenSpec: `verify`, `sync`, `archive`
- superpowers: `requesting-code-review`
- superpowers: `finishing-a-development-branch`

What to do:

1. verify completeness, correctness, and coherence
2. request or perform a review pass when appropriate
3. sync written specs/docs with delivered code
4. help the user choose how to finish the branch or change

### Route G: isolated worktree path

Use when a feature branch or isolated workspace is appropriate and higher-priority instructions do not prohibit it.

Equivalent source workflows:

- superpowers: `using-git-worktrees`

What to do:

1. detect whether isolation already exists
2. prefer environment-native isolation when available
3. otherwise use a git worktree only when appropriate
4. verify baseline health before implementation starts

Do not fight the harness or create unmanaged isolation.

## Workflow

### 1. Start with harness preflight

- Inspect repo state before suggesting architecture or code changes.
- Read `AGENTS.md`, `README.md`, and the most relevant local docs if they exist.
- If `AGENTS.md` is missing and the task is project-oriented rather than a one-off answer, propose or create an initial `AGENTS.md` early so the repo has durable guardrails before larger implementation starts.
- Treat the repo as the source of truth.
- Prefer small, reviewable changes and mechanical checks over verbal promises.

### 2. Run OpenSpec-style requirement intake before coding

For non-trivial project work, do not start implementation until intent, scope, constraints, and acceptance criteria are clear enough.

Ask concise requirement questions in small batches.
Prefer at most 3 short questions per turn.

Collect enough information to fill these artifacts:

- `proposal`: why now, scope, non-goals, impacted capabilities
- `spec`: behavior requirements and concrete scenarios
- `design`: technical approach, decisions, trade-offs
- `tasks`: ordered implementation checklist

If the user request is already precise, summarize the inferred artifacts instead of re-asking everything.

### 3. Ask the right questions

Prioritize missing information in this order:

1. goal and user-visible outcome
2. scope and non-goals
3. constraints: stack, contracts, compatibility, security, performance, deadlines
4. acceptance criteria and example scenarios
5. persistence choice: keep artifacts in chat only or also write them into the repo

Useful question shapes:

- What should be true when this is done?
- What is explicitly in scope, and what is not?
- What are 2-5 key user flows or failure cases?
- What must not change?
- How will we know this is complete?

### 4. Persist artifacts at the right level

For tiny tasks, keep artifacts lightweight in chat.
For medium or large work, or when the user wants durable planning, write artifacts into the repo.

Preferred locations:

- Repo guardrails:
  - `AGENTS.md`
  - `README.md`
- If the repo already uses `openspec/`, continue there.
- Otherwise default to `openspec/changes/<change-name>/` with:
  - `proposal.md`
  - `specs/<capability>/spec.md`
  - `design.md`
  - `tasks.md`

Keep specs behavior-first.
Put implementation detail in `design.md` and execution detail in `tasks.md`.

If the repo is still in bootstrap mode, establish these durable files in this order when useful:

1. `AGENTS.md`
2. `README.md`
3. `openspec/changes/<change-name>/...`

### 5. Convert requirements into execution

Choose the lightest execution mode that still protects quality:

- Small, clear change: brief plan plus direct implementation
- Multi-step change: write a concrete plan before coding
- Larger or riskier change: break work into task groups and checkpoints

In full mode, map this choice explicitly:

- direct implementation -> Route B
- artifact-by-artifact planning -> Route C
- plan execution -> Route D
- bug work -> Route E
- final review and branch completion -> Route F

When writing tasks, prefer the Superpowers style:

- exact file paths
- exact commands
- explicit tests or checks
- small steps
- no placeholders such as `TODO`, `later`, or "appropriate handling"

If you need more detail, read `references/superpowers-execution.md`.

### 6. Implement with Superpowers discipline

During execution:

- Prefer TDD when adding or changing behavior.
- Use systematic debugging for bug work: reproduce, isolate, fix, verify.
- Keep assumptions visible.
- Avoid speculative abstractions.
- Do not silently skip failing checks.
- Do not claim success without fresh verification evidence.

If delegation is both available and explicitly allowed by higher-priority instructions or the user, use task-scoped subagents with clear ownership.
Otherwise keep the workflow inline and retain the same review discipline.

When the task is large enough to justify it, set expectations for which route is active so the user can follow the workflow.

### 7. Verify before completion

Before saying the work is done:

- run the narrowest useful validation that actually proves the change
- read the output
- compare the result against the proposal, spec, and tasks
- report gaps honestly

For non-trivial changes, verify three dimensions:

- `completeness`: all planned tasks and required behaviors are covered
- `correctness`: behavior matches scenarios and acceptance criteria
- `coherence`: implementation still matches the chosen design and repo conventions

### 8. Close the loop

At the end:

- summarize what changed
- cite what was verified
- call out remaining risks or unverified areas
- update durable docs when they became stale
- keep any written artifacts aligned with delivered code

## Working Rules

- Ask requirement questions before coding when the project scope is not already clear.
- Do not let the spec layer become ceremony. Use the lightest artifact set that keeps the change understandable and verifiable.
- Keep user-visible behavior in specs, not framework choices.
- Prefer mechanical enforcement: tests, lint, type checks, builds, CI, and doc updates.
- Treat `AGENTS.md` as the repo-local operating contract for humans and agents; create or update it when long-lived workflow rules are missing or stale.
- Default to Chinese collaboration unless a stronger instruction or repo convention overrides it.
- Respect repo-local conventions over generic theory unless the user asks for a broader refactor.
- Respect higher-priority system, developer, and user instructions over this skill.

## Reference Map

- Read `references/openspec-patterns.md` when you need artifact structure, delta-spec style, or OpenSpec workflow vocabulary.
- Read `references/full-workflow-matrix.md` when you need the expanded route map across OpenSpec and Superpowers.
- Read `references/superpowers-execution.md` when you need stronger planning, TDD, verification, or execution discipline.
- Read `references/harness-guardrails.md` when you need tighter repo rules, validation expectations, or delivery boundaries.
- Read `references/agents-bootstrap.md` when you need to create or refresh a repo-level `AGENTS.md`.
- Read `references/sources.md` when you need to inspect the source material this skill was derived from.
