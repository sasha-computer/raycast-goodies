#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search X Likes
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 𝕏
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description Search X likes, bookmarks, and tweets via SQLite FTS5

cd ~/Developer/x

echo "━━━ Likes ━━━"
uv run search.py --table likes "$1" --limit 5 2>&1
echo ""
echo "━━━ Bookmarks ━━━"
uv run search.py --table bookmarks "$1" --limit 5 2>&1
echo ""
echo "━━━ Tweets ━━━"
uv run search.py --table tweets "$1" --limit 5 2>&1
