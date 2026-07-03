#!/usr/bin/env python3
"""Rebuild dist/ ZIPs from skills/. One ZIP per skill, with the skill folder at the root."""

import os
import zipfile
from pathlib import Path

SKILLS = [
    "humanizer",
    "prompt-master",
    "process-interviewer",
    "find-skills",
    "decision-toolkit",
    "frontend-slides",
    "mcp-builder",
    "fact-checker",
    # Marketing Specialist pack (free tier only — premium skills are
    # distributed via educasium.com, not this public repo)
    "market-quick",
    "market-copy",
    "market-seo",
    "market-competitors",
    "market-brand",
    "market-emails",
    "market-social",
    "market-ads",
    "market-funnel",
    "market-landing",
    "market-launch",
    "market-offer",
]

EXCLUDE_NAMES = {".DS_Store", "Thumbs.db", "desktop.ini"}
EXCLUDE_DIRS = {"__MACOSX", "__pycache__"}


def build(skill: str, skills_root: Path, dist_root: Path) -> None:
    src = skills_root / skill
    dst = dist_root / f"{skill}.zip"
    dist_root.mkdir(exist_ok=True)
    if dst.exists():
        dst.unlink()

    with zipfile.ZipFile(dst, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(src.rglob("*")):
            if path.is_dir():
                continue
            if path.name in EXCLUDE_NAMES:
                continue
            if any(part in EXCLUDE_DIRS for part in path.parts):
                continue
            arcname = f"{skill}/{path.relative_to(src).as_posix()}"
            zf.write(path, arcname)
    print(f"Built dist/{skill}.zip")


def main() -> None:
    repo = Path(__file__).resolve().parent
    skills_root = repo / "skills"
    dist_root = repo / "dist"
    for skill in SKILLS:
        build(skill, skills_root, dist_root)


if __name__ == "__main__":
    main()
