#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

set -e

git checkout master
git pull --depth=100
git remote | while read -r REMOTE; do
	git remote prune "$REMOTE"
	if [[ $REMOTE != origin ]]; then
		git fetch --depth=100 "$REMOTE"
	fi
done

git tag -l | xargs git tag -d
git reflog expire --expire=all --all

git gc --prune=all

git branch -a
