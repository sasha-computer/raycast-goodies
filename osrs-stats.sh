#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title OSRS Stats
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon ⚔️
# @raycast.packageName Fun

# Documentation:
# @raycast.description Check WoodFiveMan's OSRS stats from Wise Old Man

PLAYER="WoodFiveMan"

# Fetch latest from WOM API
DATA=$(curl -sf "https://api.wiseoldman.net/v2/players/$PLAYER" 2>/dev/null)

if [ -z "$DATA" ]; then
    echo "Failed to fetch stats for $PLAYER"
    exit 1
fi

echo "⚔️  WoodFiveMan — OSRS Ironman"
echo "══════════════════════════════════"
echo ""

# Parse key stats with python
echo "$DATA" | python3 -c "
import json, sys
data = json.load(sys.stdin)
latest = data.get('latestSnapshot', {}).get('data', {})
skills = latest.get('skills', {})

# Overall
overall = skills.get('overall', {})
print(f\"🏆 Overall: Level {overall.get('level', '?')} | XP {overall.get('experience', 0):,} | Rank {overall.get('rank', '?'):,}\")
print()

# Combat stats
combat_skills = ['attack', 'strength', 'defence', 'hitpoints', 'ranged', 'prayer', 'magic']
print('⚔️  Combat')
for s in combat_skills:
    skill = skills.get(s, {})
    lvl = skill.get('level', '?')
    print(f'   {s.capitalize():12s} {lvl:>4}')

print()

# Top non-combat skills by level
non_combat = {k: v for k, v in skills.items() if k not in combat_skills + ['overall']}
sorted_skills = sorted(non_combat.items(), key=lambda x: x[1].get('level', 0), reverse=True)

print('📊 Top Skills')
for name, skill in sorted_skills[:10]:
    lvl = skill.get('level', '?')
    print(f'   {name.capitalize():12s} {lvl:>4}')

print()
print(f\"🔗 https://wiseoldman.net/players/{data.get('displayName', PLAYER)}\")
" 2>/dev/null || echo "Failed to parse stats"
