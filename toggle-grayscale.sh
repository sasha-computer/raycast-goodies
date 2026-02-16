#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Grayscale
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🩶
# @raycast.packageName BetterDisplay

# Documentation:
# @raycast.description Toggle grayscale mode on all displays via BetterDisplay
# @raycast.author Sasha

CLI="/opt/homebrew/bin/betterdisplaycli"

# Check current state by trying to get the framebuffer state
# BetterDisplay doesn't expose a "get grayscale" query, so we track state with a temp file
STATE_FILE="/tmp/betterdisplay-grayscale-state"

if [ -f "$STATE_FILE" ]; then
    # Currently grayscale, switch back to normal
    "$CLI" perform -nameLike="LG" -standardFramebuffer
    "$CLI" perform -nameLike="Built" -standardFramebuffer
    rm "$STATE_FILE"
    echo "Color mode restored"
else
    # Switch to grayscale
    "$CLI" perform -nameLike="LG" -grayscaleFramebuffer
    "$CLI" perform -nameLike="Built" -grayscaleFramebuffer
    touch "$STATE_FILE"
    echo "Grayscale mode enabled"
fi
