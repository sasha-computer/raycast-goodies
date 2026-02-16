#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Focus Mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎯
# @raycast.packageName Focus

# Documentation:
# @raycast.description Grayscale + SelfControl block + Do Not Disturb. Toggle off to restore.

CLI="/opt/homebrew/bin/betterdisplaycli"
SC_CLI="/Applications/SelfControl.app/Contents/MacOS/selfcontrol-cli"
STATE_FILE="/tmp/focus-mode-state"
BLOCKLIST="$HOME/.config/selfcontrol-blocklist.selfcontrol"

if [ -f "$STATE_FILE" ]; then
    # Disable focus mode (SelfControl blocks can't be cancelled early by design)
    "$CLI" perform -nameLike="LG" -standardFramebuffer
    "$CLI" perform -nameLike="Built" -standardFramebuffer

    # Turn off DND
    shortcuts run "Turn Off Focus" 2>/dev/null || true

    rm "$STATE_FILE"
    echo "Focus mode off (SelfControl block continues until timer expires)"
else
    # Enable grayscale
    "$CLI" perform -nameLike="LG" -grayscaleFramebuffer
    "$CLI" perform -nameLike="Built" -grayscaleFramebuffer

    # Start SelfControl block (25 min) if blocklist exists and not already running
    if [ -f "$BLOCKLIST" ]; then
        RUNNING=$("$SC_CLI" is-running 2>/dev/null)
        if [ "$RUNNING" != "YES" ]; then
            END_DATE=$(date -u -v+25M +"%Y-%m-%dT%H:%M:%SZ")
            "$SC_CLI" start --blocklist "$BLOCKLIST" --enddate "$END_DATE" 2>/dev/null || true
        fi
    fi

    # Turn on DND
    shortcuts run "Turn On Focus" 2>/dev/null || true

    touch "$STATE_FILE"
    echo "Focus mode on: grayscale + SelfControl + DND"
fi
