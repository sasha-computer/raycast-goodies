#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Meeting Mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📹
# @raycast.packageName Focus

# Documentation:
# @raycast.description Pause Spotify, dim displays, enable DND. Toggle off to restore.

CLI="/opt/homebrew/bin/betterdisplaycli"
STATE_FILE="/tmp/meeting-mode-state"

if [ -f "$STATE_FILE" ]; then
    # Restore brightness
    LG_BRIGHTNESS=$(cat "$STATE_FILE" | head -1)
    BUILTIN_BRIGHTNESS=$(cat "$STATE_FILE" | tail -1)
    "$CLI" set -nameLike="LG" -brightness="$LG_BRIGHTNESS"
    "$CLI" set -nameLike="Built" -brightness="$BUILTIN_BRIGHTNESS"

    # Resume Spotify
    osascript -e 'tell application "Spotify" to play' 2>/dev/null || true

    # Turn off DND
    shortcuts run "Turn Off Focus" 2>/dev/null || true

    rm "$STATE_FILE"
    echo "Meeting mode off"
else
    # Save current brightness
    LG_BRIGHTNESS=$("$CLI" get -nameLike="LG" -brightness 2>/dev/null)
    BUILTIN_BRIGHTNESS=$("$CLI" get -nameLike="Built" -brightness 2>/dev/null)
    echo "$LG_BRIGHTNESS" > "$STATE_FILE"
    echo "$BUILTIN_BRIGHTNESS" >> "$STATE_FILE"

    # Dim displays
    "$CLI" set -nameLike="LG" -brightness=0.6
    "$CLI" set -nameLike="Built" -brightness=0.6

    # Pause Spotify
    osascript -e 'tell application "Spotify" to pause' 2>/dev/null || true

    # Turn on DND
    shortcuts run "Turn On Focus" 2>/dev/null || true

    echo "Meeting mode on: dimmed + muted + DND"
fi
