#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Brightness: Day
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ☀️
# @raycast.packageName Display

# Documentation:
# @raycast.description Set displays to daytime brightness (100% LG, 80% MacBook)

CLI="/opt/homebrew/bin/betterdisplaycli"

"$CLI" set -nameLike="LG" -brightness=1.0
"$CLI" set -nameLike="Built" -brightness=0.8
"$CLI" set -nightShift=off

echo "Day mode: bright + Night Shift off"
