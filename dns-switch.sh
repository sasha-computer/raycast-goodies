#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Switch DNS
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌐
# @raycast.packageName Network
# @raycast.argument1 { "type": "dropdown", "placeholder": "DNS Provider", "data": [{"title": "Local AdGuard", "value": "adguard"}, {"title": "Cloudflare", "value": "cloudflare"}, {"title": "Mullvad Family", "value": "mullvad-family"}, {"title": "Mullvad Base", "value": "mullvad-base"}, {"title": "Quad9", "value": "quad9"}] }

# Documentation:
# @raycast.description Switch local machine DNS provider (does not touch router)

INTERFACE=$(networksetup -listallnetworkservices | grep -E "Wi-Fi|Ethernet" | head -1)

if [ -z "$INTERFACE" ]; then
    echo "No active network interface found"
    exit 1
fi

case "$1" in
    adguard)
        networksetup -setdnsservers "$INTERFACE" 192.168.50.88
        echo "DNS: Local AdGuard (192.168.50.88)"
        ;;
    cloudflare)
        networksetup -setdnsservers "$INTERFACE" 1.1.1.1 1.0.0.1
        echo "DNS: Cloudflare (1.1.1.1)"
        ;;
    mullvad-family)
        networksetup -setdnsservers "$INTERFACE" 194.242.2.6
        echo "DNS: Mullvad Family (ad + tracker + adult blocking)"
        ;;
    mullvad-base)
        networksetup -setdnsservers "$INTERFACE" 194.242.2.2
        echo "DNS: Mullvad Base (ad + tracker blocking)"
        ;;
    quad9)
        networksetup -setdnsservers "$INTERFACE" 9.9.9.9 149.112.112.112
        echo "DNS: Quad9 (malware blocking)"
        ;;
    *)
        echo "Unknown DNS provider: $1"
        exit 1
        ;;
esac

# Flush DNS cache
dscacheutil -flushcache 2>/dev/null
sudo killall -HUP mDNSResponder 2>/dev/null || true
