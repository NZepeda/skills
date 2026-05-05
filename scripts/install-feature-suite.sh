#!/usr/bin/env bash

set -euo pipefail

skills=(
  feature-owner
  feature-intake
  design-brief-generator
  tech-spec-generator
  implementation-planner
  pr-executor
  review-guard
)

for skill in "${skills[@]}"; do
  echo "Installing ${skill}..."
  npx skills@latest add "nzepeda/skills/${skill}"
done

echo "Feature suite installed."
