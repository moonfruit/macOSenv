#!/bin/bash
# Read JSON input from stdin
INPUT=$(cat)

# Extract values using jq
MODEL_DISPLAY=$(echo "$INPUT" | jq -r '.model.display_name')
CURRENT_DIR=$(echo "$INPUT" | jq -r '.workspace.current_dir')

# shellcheck disable=SC2155
readonly GREEN=$(tput setaf 2) CYAN=$(tput setaf 6) RESET=$(tput sgr0)

# Show git branch if in a git repo
GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH=" | 🌿 $GREEN$BRANCH$RESET"
    fi
fi

echo "[$CYAN$MODEL_DISPLAY$RESET] 📁 ${CURRENT_DIR##*/}$GIT_BRANCH"
