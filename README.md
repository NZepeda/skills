# Agent Skills

A collection of agent skills that I have found to be useful in my day-to-day work. Each skill is a self-contained module that can be invoked by the agent when appropriate. The skills are designed to be composable, so that they can be combined to solve more complex problems.

## Installation

Install any skill from this repo into another repo with:

```bash
npx skills@latest nzepeda/skills/{skill-name}
```

## Skills

- `grill-me`: Stress-test a plan or design through a rigorous interview that walks each decision branch to a shared understanding.
- `write-a-prd`: Create a PRD through user interviews, codebase exploration, and module design, then save it under `./prds/`.
- `prd-to-plan`: Turn an existing PRD into a phased implementation plan using tracer-bullet vertical slices, written to `./plans/`.
