#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title System Stats
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📊
# @raycast.packageName System

# Documentation:
# @raycast.description Quick glance at CPU, RAM, disk, and network

echo "🖥  CPU & Memory"
echo "─────────────────────────────"
# CPU usage
CPU=$(top -l 1 -n 0 | grep "CPU usage" | awk '{print $3, $4, $5, $6, $7, $8}')
echo "CPU: $CPU"

# Memory
MEMORY=$(vm_stat | awk '
    /Pages free/     { free=$3 }
    /Pages active/   { active=$3 }
    /Pages inactive/ { inactive=$3 }
    /Pages speculative/ { spec=$3 }
    /Pages wired/    { wired=$3 }
    /Pages compressed/ { compressed=$3 }
    END {
        gsub(/\./,"",free); gsub(/\./,"",active); gsub(/\./,"",inactive)
        gsub(/\./,"",spec); gsub(/\./,"",wired); gsub(/\./,"",compressed)
        used = (active + wired + compressed) * 16384 / 1073741824
        total_free = (free + inactive + spec) * 16384 / 1073741824
        printf "RAM: %.1fG used, %.1fG free\n", used, total_free
    }')
echo "$MEMORY"

echo ""
echo "💾 Disk"
echo "─────────────────────────────"
df -h / | awk 'NR==2 {printf "Macintosh HD: %s used of %s (%s free, %s full)\n", $3, $2, $4, $5}'

echo ""
echo "🌐 Network"
echo "─────────────────────────────"
# Tailscale
TS_STATUS=$(tailscale status --json 2>/dev/null | grep -o '"BackendState":"[^"]*"' | cut -d'"' -f4)
echo "Tailscale: ${TS_STATUS:-unknown}"

# Public IP
PUB_IP=$(curl -sf --max-time 2 https://ifconfig.me)
echo "Public IP: ${PUB_IP:-unavailable}"

# Wi-Fi
WIFI=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/ SSID/ {print $2}')
echo "Wi-Fi: ${WIFI:-not connected}"

echo ""
echo "🔋 Battery"
echo "─────────────────────────────"
pmset -g batt | grep -o '[0-9]*%; [a-z]*' | head -1 || echo "No battery info"
