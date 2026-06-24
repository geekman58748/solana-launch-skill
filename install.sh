#!/usr/bin/env bash
set -euo pipefail

# solana-launch-skill installer
# Installs into the Solana AI Kit (Claude Code / Codex) skill hub

SKILL_NAME="solana-launch-skill"
SKILL_REPO="https://github.com/YOUR_REPO/solana-launch-skill"
KIT_SKILLS_DIR="${CLAUDE_SKILLS_DIR:-.claude/skills}"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  solana-launch-skill — Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Detect install mode
if [ -f "CLAUDE.md" ] || [ -d ".claude" ]; then
  INSTALL_MODE="kit"
  echo "✓ Solana AI Kit detected — installing into kit skills directory"
else
  INSTALL_MODE="standalone"
  echo "ℹ  No kit detected — installing as standalone skill"
fi

# Create skills directory if needed
mkdir -p "$KIT_SKILLS_DIR"

SKILL_DIR="$KIT_SKILLS_DIR/$SKILL_NAME"

# Clone or update
if [ -d "$SKILL_DIR/.git" ]; then
  echo "↻  Updating existing installation..."
  git -C "$SKILL_DIR" pull --ff-only
else
  echo "↓  Cloning $SKILL_NAME..."
  git clone --depth 1 "$SKILL_REPO" "$SKILL_DIR"
fi

echo ""
echo "✓ Skill installed at: $SKILL_DIR"
echo ""

# Kit integration: add to CLAUDE.md hub if it exists
if [ "$INSTALL_MODE" = "kit" ] && [ -f "CLAUDE.md" ]; then
  if grep -q "solana-launch-skill" CLAUDE.md; then
    echo "✓ Already registered in CLAUDE.md — no changes needed"
  else
    echo "" >> CLAUDE.md
    echo "## solana-launch-skill" >> CLAUDE.md
    echo "Protocol and token launch playbook. Load \`$SKILL_DIR/skill/SKILL.md\` for routing." >> CLAUDE.md
    echo "" >> CLAUDE.md
    echo "✓ Registered in CLAUDE.md"
  fi
fi

# Verify installation
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  INSTALLATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Start here:  $SKILL_DIR/skill/SKILL.md"
echo ""
echo "Commands available:"
echo "  /launch-audit    — Full launch readiness report"
echo "  /tokenomics-sim  — Token distribution modeler"
echo "  /launch-sim      — Launch day dynamics simulator"
echo ""
echo "Quick test (no terminal needed):"
echo "  1. Open Claude.ai → your project"
echo "  2. Add skill/SKILL.md as a knowledge file"
echo "  3. Ask: 'Run /launch-audit for my Solana protocol'"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
