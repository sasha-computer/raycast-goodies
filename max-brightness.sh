#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Max Brightness
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔆
# @raycast.packageName Display

# Documentation:
# @raycast.description Max brightness on all displays, XDR on MacBook (1600 nits)

CLI="/opt/homebrew/bin/betterdisplaycli"

"$CLI" set -nameLike="LG" -brightness=1.0
"$CLI" set -nameLike="Built" -brightness=1.6

echo "Max brightness: LG 100% / MacBook XDR 1600 nits"
