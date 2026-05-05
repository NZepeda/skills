#!/usr/bin/env bash

set -euo pipefail

echo "Installing feature suite for Codex in the current project..."

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

echo "Feature suite installed."
