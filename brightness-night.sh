#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Brightness: Night
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌙
# @raycast.packageName Display

# Documentation:
# @raycast.description Set displays to nighttime brightness (50% LG, 40% MacBook, Night Shift on)

CLI="/opt/homebrew/bin/betterdisplaycli"

"$CLI" set -nameLike="LG" -brightness=0.5
"$CLI" set -nameLike="Built" -brightness=0.4
"$CLI" set -nightShift=on

echo "Night mode: dimmed + Night Shift on"
