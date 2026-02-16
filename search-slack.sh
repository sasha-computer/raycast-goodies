#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Slack
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 💬
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description Search Slack messages via local SQLite FTS5

cd ~/Developer/slack-db
uv run search.py "$1" --limit 10 2>/dev/null
