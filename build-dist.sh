#!/bin/bash
# Regenerates all ZIPs in dist/ from the skills/ folder.
# Run this after any change to a skill.
# Usage: bash build-dist.sh

set -e

SKILLS=(
  humanizer
  prompt-master
  process-interviewer
  find-skills
  decision-toolkit
  frontend-slides
  mcp-builder
  fact-checker
)

mkdir -p dist

for skill in "${SKILLS[@]}"; do
  zip -r "dist/${skill}.zip" "skills/${skill}" -x "*.DS_Store" -x "__MACOSX/*"
  echo "✅ dist/${skill}.zip"
done

echo ""
echo "All ZIPs updated in dist/"
