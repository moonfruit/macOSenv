#!/usr/bin/env bash
{
    IFS= read -r json
    IFS= read -r model
} < <(jq -rn 'input | .model.display_name |= sub("-highspeed$"; "") | [., .model.id] | map(tostring) | join("\n")')

script="${BASH_SOURCE[0]}"
while [[ -L "$script" ]]; do
    script="$(readlink "$script")"
done
script_dir="$(cd "$(dirname "$script")" && pwd)"
export PATH="$script_dir:$PATH"

if [[ "$model" == MiniMax-* ]]; then
    echo "$json" | ccstatusline --config "$HOME/.config/ccstatusline/settings-mini.json"
else
    echo "$json" | ccstatusline
fi
