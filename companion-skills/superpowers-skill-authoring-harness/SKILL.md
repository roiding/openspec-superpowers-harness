---
name: superpowers-skill-authoring-harness
description: Use when Codex needs to create, revise, split, or validate skills and should apply the superpowers writing-skills methodology together with trigger-quality checks, test-driven documentation loops, and harness-style guardrails for durable skill design.
---

# Superpowers Skill Authoring Harness

## Overview

Create or revise skills with a stronger methodology than simply writing a `SKILL.md`.
Use this companion for skill authoring, skill refactoring, companion-skill extraction, and skill validation work.

## Workflow

### 1. Define the skill boundary first

Before writing or editing a skill, decide:

- what repeated task it serves
- what should trigger it
- what should stay out of scope
- whether it belongs in the main skill or a companion skill

### 2. Use a documentation TDD loop

Treat skill writing like a red-green-refactor loop:

- establish baseline failure or missing behavior
- write the smallest skill content that addresses it
- validate structure and trigger quality
- tighten wording when new loopholes appear

### 3. Optimize for discovery

The frontmatter description must explain when to use the skill, not merely what it does.

Focus on:

- trigger conditions
- symptoms
- contexts
- language the future agent is likely to search for

### 4. Keep context lean

Move detailed references out of the main `SKILL.md` when they would otherwise bloat the trigger-time context.

### 5. Validate before publishing

Before calling the skill ready:

- validate structure
- inspect frontmatter trigger quality
- verify references are coherent
- ensure the skill has a clear reason to exist

## Guardrails

- Do not create a skill for one-off project notes.
- Do not stuff auxiliary process history into the skill.
- Do not make the description a workflow summary that lets future agents skip reading the body.
- Split into companion skills when one skill becomes too broad to route reliably.

## Reference Map

- Read `references/skill-tdd-loop.md` for the documentation TDD loop.
- Read `references/trigger-quality.md` for description/frontmatter quality rules.
