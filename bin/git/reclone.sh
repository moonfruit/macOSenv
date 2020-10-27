#!/usr/bin/env bash

if [[ -d $1 ]]; then
	cd "$1" || exit 1
fi

[[ -d .git ]] || exit 1

REMOTE=$(git remote -v | rg origin | awk2 | head -1)

TMP=$(mktemp -d)
cleanup() {
	rm -fr "$TMP"
}
trap cleanup EXIT

OLD=$(pwd)
NAME=$(basename "$OLD")
cd "$TMP" || exit 1

git clone --depth=100 "$REMOTE" "$NAME"
BAK=$OLD/$NAME-git
mv "$OLD/.git" "$BAK"
trash "$BAK"
mv "$NAME/.git" "$OLD"
