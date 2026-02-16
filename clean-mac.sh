#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean Mac
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🧹
# @raycast.packageName System

# Documentation:
# @raycast.description Preview what mo (Mole) would clean, then run it

echo "🧹 Running mo clean (preview)..."
echo "════════════════════════════════"
echo ""

mo clean --dry-run 2>&1

echo ""
echo "─────────────────────────────"
echo "Run 'mo clean' in terminal to execute cleanup"
