# Agent Skills

A collection of agent skills that I have found to be useful in my day-to-day work. Each skill is a self-contained module that can be invoked by the agent when appropriate. The skills are designed to be composable, so that they can be combined to solve more complex problems.

## Installation

Install any skill from this repo into another repo with:

```bash
npx skills@latest nzepeda/skills/{skill-name}
```

Install the full feature workflow into another repo with one command:

```bash
curl -fsSL https://raw.githubusercontent.com/nzepeda/skills/main/scripts/install-feature-suite.sh | bash
```

That installer performs a non-interactive local project install for Codex.

## Skills

- `grill-me`: Stress-test a plan or design through a rigorous interview that walks each decision branch to a shared understanding.
- `write-a-prd`: Create a PRD through user interviews, codebase exploration, and module design, then save it under `./prds/`.
- `prd-to-plan`: Turn an existing PRD into a phased implementation plan using tracer-bullet vertical slices, written to `./plans/`.
- `feature-owner`: Orchestrate a feature end-to-end, starting with a mandatory clarification interview, then require explicit approval before kickoff, technical planning, and implementation.
- `feature-intake`: Normalize a rough feature request into a structured feature brief.
- `design-brief-generator`: Turn a feature brief into a design review artifact with flows, states, and open questions.
- `tech-spec-generator`: Turn an approved brief and design direction into a technical proposal with tradeoffs.
- `implementation-planner`: Break an approved spec into reviewable implementation chunks.
- `pr-executor`: Implement one planned chunk at a time and keep the diff narrow.
- `review-guard`: Review a chunk for regressions, scope creep, and missing tests before it is considered complete.

## Feature Automation Flow

The feature automation skills are meant to be composed in this order:

1. `grill-me`
2. `feature-owner`
3. `feature-intake`
4. `design-brief-generator`
5. `tech-spec-generator`
6. `implementation-planner`
7. `pr-executor`
8. `review-guard`

The intended operating model is:

- You describe the feature once.
- `feature-owner` first uses `grill-me` to clarify outstanding questions and reach a shared understanding.
- You explicitly approve that shared understanding.
- `feature-owner` asks for explicit approval before starting the workflow.
- The workflow creates `./docs/features/<feature-slug>/`.
- You explicitly approve the design direction.
- You explicitly approve the technical shape.
- You explicitly approve implementation before any code work starts.
- The remaining work proceeds one reviewable chunk at a time.

If you want the whole workflow available in a target project, use the installer script above. It installs:

- `grill-me`
- `feature-owner`
- `feature-intake`
- `design-brief-generator`
- `tech-spec-generator`
- `implementation-planner`
- `pr-executor`
- `review-guard`

Equivalent direct command:

```bash
npx skills@latest add nzepeda/skills \
  --skill grill-me \
  --skill feature-owner \
  --skill feature-intake \
  --skill design-brief-generator \
  --skill tech-spec-generator \
  --skill implementation-planner \
  --skill pr-executor \
  --skill review-guard \
  --agent codex \
  --yes
```
