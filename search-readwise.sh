#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Readwise Reader
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📚
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description Search saved articles and highlights in Readwise Reader

~/.pi/agent/skills/readwise-reader/scripts/mcp-call.sh reader_search_documents "{\"query\":\"$1\"}" 2>&1
