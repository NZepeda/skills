#!/usr/bin/env bash

set -euo pipefail

AGENT="${1:-codex}"

echo "Installing feature suite for ${AGENT} in the current project..."

npx skills@latest add nzepeda/skills \
  --skill grill-me \
  --skill feature-owner \
  --skill feature-intake \
  --skill design-brief-generator \
  --skill tech-spec-generator \
  --skill implementation-planner \
  --skill pr-executor \
  --skill review-guard \
  --agent "$AGENT" \
  --yes

echo "Feature suite installed."
