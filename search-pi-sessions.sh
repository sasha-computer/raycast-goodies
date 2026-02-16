#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Pi Sessions
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🥧
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description Search pi coding agent session history

pi-fzf --query "$1" --no-fzf 2>/dev/null || {
    # Fallback: grep session directories directly
    SESSIONS_DIR="$HOME/.pi/sessions"
    if [ -d "$SESSIONS_DIR" ]; then
        grep -rl "$1" "$SESSIONS_DIR"/*/messages.jsonl 2>/dev/null | head -10 | while read -r f; do
            SESSION_DIR=$(dirname "$f")
            SESSION_NAME=$(basename "$SESSION_DIR")
            LAST_MSG=$(grep -o '"content":"[^"]*"' "$f" | tail -1 | cut -c12- | head -c 120)
            echo "📁 $SESSION_NAME"
            echo "   $LAST_MSG"
            echo ""
        done
    fi
}
