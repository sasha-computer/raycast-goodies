# raycast-goodies

Personal [Raycast](https://raycast.com) script commands for display control, focus modes, search, and system management.

## Scripts

### Display

| Script | Description |
|---|---|
| **Toggle Grayscale** 🩶 | Grayscale mode on all displays via BetterDisplay |
| **Toggle Invert Colors** 🔲 | Invert colors on all displays |
| **Brightness: Day** ☀️ | Full brightness, Night Shift off |
| **Brightness: Night** 🌙 | Dimmed, Night Shift on |
| **Brightness: Presentation** 📺 | Max brightness + XDR boost on MacBook |
| **Restart Daylight Mirror** 🪞 | Kill and relaunch Daylight Mirror |

### Focus

| Script | Description |
|---|---|
| **Toggle Focus Mode** 🎯 | Grayscale + SelfControl block + DND |
| **Toggle Meeting Mode** 📹 | Pause Spotify, dim displays, enable DND |

### Search

| Script | Description |
|---|---|
| **Search Emails** 📧 | Search 42K+ emails via local SQLite FTS5 |
| **Search X Likes** 𝕏 | Search 13K+ X/Twitter likes, bookmarks, tweets |
| **Search Readwise Reader** 📚 | Search saved articles and highlights |
| **Search Pi Sessions** 🥧 | Search pi coding agent session history |

### Network

| Script | Description |
|---|---|
| **Switch DNS** 🌐 | Switch between AdGuard, Cloudflare, Mullvad Family, Mullvad Base, Quad9 |
| **Toggle Tailscale** 🔗 | Connect or disconnect Tailscale VPN |

### System

| Script | Description |
|---|---|
| **System Stats** 📊 | CPU, RAM, disk, network, battery at a glance |
| **Clean Mac** 🧹 | Preview cleanup via [Mole](https://github.com/tw93/mole) |

### Fun

| Script | Description |
|---|---|
| **OSRS Stats** ⚔️ | Check WoodFiveMan's Old School RuneScape stats |

## Dependencies

- [BetterDisplay](https://github.com/waydabber/BetterDisplay) + `betterdisplaycli` for display scripts
- [SelfControl](https://selfcontrolapp.com) for focus mode
- [Mole](https://github.com/tw93/mole) (`mo`) for clean mac
- [Tailscale](https://tailscale.com) for VPN toggle
- Local email/X/Readwise indexes for search scripts

## Setup

1. Clone this repo
2. In Raycast: Extensions > Script Commands > Add Script Directory > select the cloned folder
3. All scripts appear in Raycast search

## License

MIT
