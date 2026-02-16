#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Invert Colors
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔲
# @raycast.packageName Display

# Documentation:
# @raycast.description Toggle inverted colors on all displays via BetterDisplay

CLI="/opt/homebrew/bin/betterdisplaycli"
STATE_FILE="/tmp/betterdisplay-invert-state"

if [ -f "$STATE_FILE" ]; then
    "$CLI" perform -nameLike="LG" -standardFramebuffer
    "$CLI" perform -nameLike="Built" -standardFramebuffer
    rm "$STATE_FILE"
    echo "Normal colors restored"
else
    "$CLI" perform -nameLike="LG" -invertedFramebuffer
    "$CLI" perform -nameLike="Built" -invertedFramebuffer
    touch "$STATE_FILE"
    echo "Colors inverted"
fi
