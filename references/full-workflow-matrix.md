# Full Workflow Matrix

Use this reference when the task needs more than the default compact flow.

## Mode selection

Choose `core` when:

- the request is already clear
- the implementation surface is modest
- the user wants speed over process richness

Choose `full` when:

- requirements are still moving
- the change is large, risky, or multi-step
- the user wants a formal planning path
- debugging or verification deserves its own workflow
- branch isolation or review needs explicit handling

## OpenSpec mapping

### OpenSpec core profile

Best for compact execution:

- `propose`
- `apply`
- `sync`
- `archive`

Translate this into Codex as:

1. create or summarize planning artifacts
2. implement
3. reconcile written specs/docs
4. close out

### OpenSpec expanded profile

Best for controlled planning:

- `explore`
- `new`
- `continue`
- `ff`
- `apply`
- `verify`
- `bulk-archive`
- `onboard`

Translate these concepts into Codex as:

- `explore`: research and requirement clarification
- `new`: establish a named change container
- `continue`: create the next artifact deliberately
- `ff`: generate the planning stack in one pass
- `apply`: implement tasks
- `verify`: compare code vs artifacts
- `bulk-archive`: reconcile multiple parallel changes
- `onboard`: guide a user through the whole workflow end-to-end

## Superpowers mapping

Primary execution-related skills to emulate or reference:

- `brainstorming`
- `writing-plans`
- `executing-plans`
- `subagent-driven-development`
- `test-driven-development`
- `systematic-debugging`
- `requesting-code-review`
- `verification-before-completion`
- `using-git-worktrees`
- `finishing-a-development-branch`

## Router table

| Situation | OpenSpec side | Superpowers side | Recommended route |
|---|---|---|---|
| Idea is fuzzy | `explore` | `brainstorming` | Route A |
| Small clear feature | `propose` or `new -> ff` | light planning + TDD | Route B |
| Large clear feature | `new -> continue` | `writing-plans` | Route C |
| Written plan exists | `apply` | `executing-plans` | Route D |
| Delegated large execution explicitly allowed | `apply` | `subagent-driven-development` | Route D |
| Bug or regression | `explore` if needed | `systematic-debugging` | Route E |
| Pre-merge confidence pass | `verify`, `sync`, `archive` | `requesting-code-review`, `verification-before-completion` | Route F |
| Isolation needed | repo/workspace prep | `using-git-worktrees` | Route G |
| Delivery wrap-up | archive intent | `finishing-a-development-branch` | Route F |

## Important adaptation rule

This skill is an adaptation, not a verbatim runtime.
Use the source workflow concepts, but always obey the current Codex environment, higher-priority instructions, and user preferences.
