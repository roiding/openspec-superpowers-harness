# Tool and Delivery Mapping

Use this reference when OpenSpec behavior must be mapped to a specific AI tool.

## Delivery concepts

- skills delivery
- commands delivery
- both

Not every tool supports both equally.

## Adaptation rule

If the environment does not support a native OpenSpec command runtime, use the workflow intent through skills and direct Codex behavior instead of faking slash-command support.

## Codex-specific note

Codex can host skill-style behavior cleanly.
Do not assume OpenSpec CLI command generation is the same thing as Codex skill execution.
