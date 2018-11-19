#!/bin/bash
set -e

CURRENT=$(git symbolic-ref --short HEAD)
if [[ $CURRENT != master ]]; then
	git checkout master
fi

git pull --ff-only upstream master
git push
for REMOTE in $(git remote); do
	git remote prune "$REMOTE"
done

if [[ $CURRENT != master ]]; then
	git checkout "$CURRENT"
fi
