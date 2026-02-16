#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Brightness: Presentation
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📺
# @raycast.packageName Display

# Documentation:
# @raycast.description Max brightness on all displays + XDR boost on MacBook

CLI="/opt/homebrew/bin/betterdisplaycli"

"$CLI" set -nameLike="LG" -brightness=1.0
"$CLI" set -nameLike="Built" -brightness=1.0
"$CLI" set -nameLike="Built" -nativeBrightnessUpscaling=on

echo "Presentation mode: max brightness + XDR boost"
