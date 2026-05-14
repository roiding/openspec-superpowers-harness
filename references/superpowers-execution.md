# Superpowers Execution

Use this reference when moving from agreed scope into implementation.

## Planning standard

For multi-step work, create a plan that includes:

- exact file paths
- exact commands
- explicit validation steps
- small, independently checkable tasks

Avoid placeholder wording such as:

- `TODO`
- "later"
- "appropriate handling"
- "write tests for the above"

## TDD default

When behavior changes, prefer:

1. write a failing test
2. run it and confirm the failure is meaningful
3. write the smallest implementation that makes it pass
4. rerun the test and the nearest useful suite
5. refactor only while staying green

If the environment or task genuinely makes TDD impractical, state that clearly and compensate with another concrete validation method.

## Debugging standard

For bugs:

1. reproduce the issue
2. isolate the cause
3. fix the smallest responsible surface
4. add or update regression coverage
5. verify the original symptom is gone

## Delegation adaptation

If the platform and higher-priority instructions allow subagents, prefer:

- bounded task ownership
- clear file scope
- review before integration

If subagents are unavailable or disallowed, keep the same discipline inline:

- one task at a time
- verify before moving on
- do not collapse plan, implementation, and review into one vague step

## Verification rule

Do not claim completion without fresh evidence.
Run the command that proves the claim, read the output, and report the actual result.
