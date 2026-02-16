#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Emails
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📧
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description Search 42K+ emails via local SQLite FTS5 index

~/.pi/agent/skills/email/scripts/search.sh "$1" --limit 10
