#!/usr/bin/env bash
if [[ -z "$proxy" ]] && proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi	
echo "$0" "$@"
env | grep -i proxy
