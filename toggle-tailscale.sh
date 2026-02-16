#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Tailscale
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔗
# @raycast.packageName Network

# Documentation:
# @raycast.description Connect or disconnect Tailscale VPN

STATUS=$(tailscale status --json 2>/dev/null | grep -o '"BackendState":"[^"]*"' | cut -d'"' -f4)

if [ "$STATUS" = "Running" ]; then
    tailscale down
    echo "Tailscale disconnected"
else
    tailscale up
    echo "Tailscale connected"
fi
