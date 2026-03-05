#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Signal
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💬
# @raycast.packageName Signal

# Documentation:
# @raycast.description Launch Signal with menu bar tray icon

# If Signal is already running, just bring it to front
if pgrep -x "Signal" > /dev/null; then
    open -a Signal
else
    open -a Signal --args --use-tray-icon --start-in-tray
fi
