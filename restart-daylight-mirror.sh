#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restart Daylight Mirror
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🪞
# @raycast.packageName Display

# Documentation:
# @raycast.description Kill and relaunch Daylight Mirror

pkill -f "Daylight Mirror" 2>/dev/null
sleep 1
open -a "Daylight Mirror"

echo "Daylight Mirror restarted"
