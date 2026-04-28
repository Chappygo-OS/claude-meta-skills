#!/usr/bin/env bash
# Install all Claude meta-skills to ~/.claude/skills/

set -e

SKILLS_DIR="$(cd "$(dirname "$0")/skills" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: skills/ directory not found. Run this script from the repo root."
  exit 1
fi

mkdir -p "$TARGET_DIR"

skills=(
  "process-interviewer"
  "prompt-master"
  "humanizer"
  "fact-checker"
  "find-skills"
  "frontend-slides"
  "decision-toolkit"
  "mcp-builder"
)

echo "Installing Claude meta-skills to $TARGET_DIR"
echo ""

for skill in "${skills[@]}"; do
  src="$SKILLS_DIR/$skill"
  dst="$TARGET_DIR/$skill"
  if [ -d "$src" ]; then
    cp -r "$src" "$dst"
    echo "  ✓ $skill"
  else
    echo "  ✗ $skill (not found, skipping)"
  fi
done

echo ""
echo "Done. Restart Claude Code and invoke any skill with /$skill-name"
