# OpenSpec Superpowers Harness

An integrated Codex skill that combines three layers into one delivery workflow:

- `OpenSpec` for requirement clarification and planning artifacts
- `superpowers` for planning, implementation, debugging, verification, and close-out discipline
- `Harness Engineering` for repo guardrails, source-of-truth discipline, and mechanical validation

This repository is **not** a mirror of OpenSpec or superpowers.
It is an adaptation for the current Codex environment.

## Goal

When Codex is asked to build a project, the intended default behavior is:

1. read or establish `AGENTS.md`
2. clarify requirements before writing code
3. organize work around `proposal / spec / design / tasks`
4. implement with `TDD / debugging discipline / verification-first`
5. deliver with Harness-style repo and documentation guardrails

## Modes

### `core mode`

Best for small or medium tasks with relatively clear scope.

### `full mode`

Best for larger, riskier, or more iterative tasks that need route selection across:

- exploratory clarification
- artifact-by-artifact planning
- plan-driven execution
- debugging-first flows
- review and close-out flows
- isolated worktree handling

See [full-workflow-matrix.md](./references/full-workflow-matrix.md).

## What is integrated

### From OpenSpec

Integrated core ideas:

- requirements before code
- `proposal / spec / design / tasks`
- `core` and `expanded` workflow intent
- mapping for `explore / propose / apply / verify / sync / archive`
- behavior-first specs
- delta-style change expression

### From superpowers

Integrated primary delivery flows:

- `brainstorming`
- `writing-plans`
- `executing-plans`
- constrained mapping of `subagent-driven-development`
- `test-driven-development`
- `systematic-debugging`
- `requesting-code-review`
- `verification-before-completion`
- `using-git-worktrees`
- `finishing-a-development-branch`

### From Harness Engineering

Integrated guardrails:

- repo as source of truth
- `AGENTS.md` first
- durable information belongs in versioned files
- small changes, mechanical checks, doc synchronization

## What is not integrated verbatim

This skill does **not** include every piece of both upstream repositories.

That omission is deliberate.

### 1. Runtime and platform-specific layers

Examples:

- native OpenSpec slash-command runtime
- tool-specific command adapters
- host-environment-specific injection behavior

Reason:

- this repository is a Codex skill, not the OpenSpec CLI runtime
- copying those layers literally would create fake capabilities

### 2. Repo content that is not part of the project-delivery critical path

Examples:

- installation docs
- release notes
- community listings
- maintainer docs
- telemetry notes

Reason:

- they are useful repository content, but not core execution knowledge for this skill

### 3. Specialized branches of superpowers that should not trigger by default

Examples:

- `mcp-builder`
- `writing-skills`
- some platform-specific or niche workflow skills

Reason:

- they are real workflows, but too specialized for the default project-delivery path

### 4. Flows that require adaptation under current higher-priority instructions

Examples:

- full-strength multi-subagent execution as a default runtime behavior

Reason:

- the current Codex environment has higher-priority instructions and constraints
- this repository preserves workflow intent, then adapts it safely

## Companion skills

This repository also includes optional companion skills under [companion-skills](./companion-skills):

- `openspec-workspace-customization`
- `superpowers-mcp-builder-harness`
- `superpowers-skill-authoring-harness`

These were split out because they are valuable but too specialized to load by default for normal project delivery.

Important:

Nested companion folders are **not automatically discovered** just because the main skill is installed.
To use a companion, install that companion folder as its own skill folder in your Codex skills directory.

## Default language policy

The main skill defaults to Chinese collaboration in chat, unless:

- the user explicitly asks for English
- a higher-priority instruction requires English
- the repo is clearly English-first

Repository files, identifiers, and code conventions should still follow the project’s own dominant style.

## Sources

See [sources.md](./references/sources.md).

## Example prompts

Copy-and-run examples:

- `Use openspec-superpowers-harness to kick off this project in full mode and clarify requirements before implementation.`
- `Use openspec-superpowers-harness in core mode to implement this feature, but confirm scope first.`
- `Handle this production bug with openspec-superpowers-harness Route E and find the root cause before proposing a fix.`
- `Use openspec-superpowers-harness to turn this request into proposal, spec, design, and tasks.`
- `This is a larger change. Use openspec-superpowers-harness Route C and build the artifacts one by one.`
