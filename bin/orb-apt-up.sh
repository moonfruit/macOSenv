#!/bin/bash
set -euo pipefail

PREFIX=()
if [[ -z "${DARK_ENABLED:-}" ]] && command -v dark &>/dev/null; then
	PREFIX+=(dark)
fi
if [[ -z "${PROXY_ENABLED:-}" ]] && command -v proxy &>/dev/null; then
	PREFIX+=(proxy)
fi

echo "Running with prefix: ${PREFIX[*]:-none}"
if ((${#PREFIX[@]})); then
	exec "${PREFIX[@]}" "$0" "$@"
fi

orb sudo apt update && orb sudo apt upgrade --autoremove --yes
