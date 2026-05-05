---
name: feature-owner
description: Orchestrate a new feature from request to implementation by creating a feature workspace, generating design and technical proposals, and stopping for explicit user approval before kickoff, before technical planning, and before implementation. Use when the user wants a feature built end-to-end with minimal input after an initial description.
---

# Feature Owner

This skill coordinates a feature workflow. It must never treat silence, implication, or positive sentiment as approval.

## Workflow contract

Create a feature workspace under `./docs/features/<feature-slug>/` with:

- `brief.md`
- `design.md`
- `tech-spec.md`
- `plan.md`
- `status.yaml`

If the folder already exists, resume from `status.yaml` instead of restarting.

Before starting any workflow work, obtain explicit user approval to begin. A feature request alone is not approval to start.

## State machine

Track one of these states in `status.yaml`:

- `awaiting-kickoff-approval`
- `drafting-brief`
- `awaiting-design-approval`
- `design-approved`
- `awaiting-tech-approval`
- `tech-approved`
- `awaiting-implementation-approval`
- `planning`
- `implementing`
- `awaiting-user-input`
- `done`

Also track:

- `feature`
- `slug`
- `current_chunk`
- `completed_chunks`
- `open_questions`
- `blockers`

## Process

1. Ask whether the user wants to start the workflow now. Set state to `awaiting-kickoff-approval`.
2. Only after explicit approval, normalize the request with `feature-intake` and write `brief.md`.
3. Generate `design.md` with `design-brief-generator`.
4. Pause and ask for explicit design approval or edits. Update state to `awaiting-design-approval`.
5. Only after explicit design approval, generate `tech-spec.md` with `tech-spec-generator`.
6. Pause and ask for explicit technical approval or edits. Update state to `awaiting-tech-approval`.
7. Only after explicit technical approval, generate `plan.md` with `implementation-planner`.
8. Pause and ask for explicit approval to begin implementation. Update state to `awaiting-implementation-approval`.
9. Only after explicit implementation approval, implement one reviewable chunk at a time with `pr-executor`.
10. Run `review-guard` on each chunk before considering it complete.
11. Update `status.yaml` after every stage transition.

## Operating rules

- Do not ask broad, open-ended questions when a reasonable default exists.
- Do not skip the kickoff, design, technical, or implementation approval gates.
- Ask only for concrete decisions, not for restating prior context.
- Keep implementation chunks small enough to be comfortably reviewable in a single PR.
- Prefer existing repo patterns over inventing new abstractions.
- If ambiguity is minor, document the assumption in the artifact and continue.
- If ambiguity materially changes UX or architecture, stop and ask.
- Never infer approval from phrases like "looks good", "continue", or "sounds fine" unless the user is explicitly approving the named gate.

## Explicit approval policy

Accept approval only when the user clearly approves the specific gate, for example:

- `I approve starting the workflow.`
- `I approve the design direction.`
- `I approve the technical approach.`
- `I approve implementation to begin.`

If approval is ambiguous, ask for a clearer yes/no decision and do not proceed.

## Approval prompts

At the kickoff gate, present:

- the feature summary
- the artifacts that will be created
- a direct request for approval to begin

At the design gate, present:

- the proposed user flow
- important states and edge cases
- unresolved UX questions

At the technical gate, present:

- the proposed architecture
- APIs and schema changes
- rollout/testing implications
- the recommended approach and the main alternative

At the implementation gate, present:

- the planned chunks
- the first chunk to be executed
- any known risks before code changes start

## Completion

The workflow is complete only when:

- all planned chunks are implemented or consciously deferred
- relevant tests pass or failures are explained
- `status.yaml` is updated to `done`
