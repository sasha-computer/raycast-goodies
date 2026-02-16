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
# @raycast.description Search 13K+ X/Twitter likes, bookmarks, and own tweets via SQLite FTS5

cd ~/Developer/x && uv run search.py "$1" --limit 10
