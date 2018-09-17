#!/usr/bin/env bash

DEST=$1
if [[ -z $DEST ]]; then
	DEST="$HOME/Documents"
fi

RSYNC=/usr/local/bin/rsync
ARGS=(-aXh --delete --delete-excluded)

if [[ -t 1 ]]; then
	ARGS+=("--info=stats3,progress2")
else
	ARGS+=(-v "--info=stats3")
fi

ARGS+=(
	"--exclude=.DS_Store"
	"--exclude=Thumbs.db"
	"--exclude=.*.swp"
	"--exclude=*.log"
	"--exclude=*.o"
	"--exclude=*.a"
	"--exclude=*.lo"
	"--exclude=*.la"
	"--exclude=*.so"
	"--exclude=*.so.*"
	"--exclude=*.dylib"
	"--exclude=*.class"
	"--exclude=*.jar"
	"--exclude=target/"
	"--exclude=*.luac"
	"--exclude=*.pyc"
	"--exclude=__pycache__/"
	"--exclude=node_modules/"
	"--exclude=Medis-darwin-x64/"
	"--exclude=/go/bin/"
	"--exclude=/go/pkg/"
)

"$RSYNC" "${ARGS[@]}" "$WORKSPACE" "$DEST"
