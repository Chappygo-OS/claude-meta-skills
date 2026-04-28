#!/usr/bin/env bash
# Rebuild dist/*.zip from skills/*. Run after editing any skill.

set -e

SKILLS_DIR="$(cd "$(dirname "$0")/skills" && pwd)"
DIST_DIR="$(cd "$(dirname "$0")" && pwd)/dist"

mkdir -p "$DIST_DIR"

echo "Building skill zips into $DIST_DIR"
echo ""

count=0
for skill_path in "$SKILLS_DIR"/*/; do
  skill="$(basename "$skill_path")"
  zipfile="$DIST_DIR/$skill.zip"
  rm -f "$zipfile"
  (cd "$skill_path" && zip -qr "$zipfile" . -x "*.DS_Store" -x "__pycache__/*")
  echo "  ✓ $skill.zip"
  count=$((count + 1))
done

echo ""
echo "Built $count zip(s)."
