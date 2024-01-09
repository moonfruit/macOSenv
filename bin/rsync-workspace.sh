#!/usr/bin/env bash

DEST=$1
if [[ -z $DEST ]]; then
	DEST="$HOME/Resources.localized"
fi

RSYNC=/opt/homebrew/bin/rsync
SED=/opt/homebrew/bin/gsed
ARGS=(-aXh --delete --delete-excluded)

if [[ -t 1 ]]; then
	ARGS+=("--info=stats3,progress2")
else
	ARGS+=(-v --stats)
fi

ROOT=$(basename "$WORKSPACE")
ARGS+=(
	"--include=/$ROOT/env/bin/"
	"--exclude=.DS_Store"
	"--exclude=Thumbs.db"
	"--exclude=.*.swp"
	"--exclude=*.log"
	"--exclude=*.log.*.gz"
	"--exclude=*.o"
	"--exclude=*.a"
	"--exclude=*.lo"
	"--exclude=*.la"
	"--exclude=*.so"
	"--exclude=*.so.*"
	"--exclude=*.dylib"
	"--exclude=*.dylib.*"
	"--exclude=*.class"
	"--exclude=*.jar"
	"--exclude=*.luac"
	"--exclude=*.pyc"
	"--exclude=__pycache__/"
	"--exclude=venv/"
	"--exclude=build/"
	"--exclude=gwt-unitCache/"
	"--exclude=overlays/"
	"--exclude=out/"
	"--exclude=target/"
	"--exclude=Medis-darwin-x64/"
	"--exclude=node_modules/"
	"--exclude=vendor/"
	"--exclude=third_party/"
	"--exclude=.svn/"
	"--exclude=.tmp/"
	"--exclude=bin/"
	"--exclude=/$ROOT/tmp/"
	"--exclude=/$ROOT/temp/"
	"--exclude=/$ROOT/zoo/"
	"--exclude=/$ROOT/java3/"
	"--exclude=/$ROOT/xcode/XVim2/"
	"--exclude=/$ROOT/go/bin/"
	"--exclude=/$ROOT/go/pkg/"
	"--exclude=/$ROOT/go/mod/"
	"--include=/$ROOT/go/src/"
	"--include=/$ROOT/go/src/github.com/"
	"--include=/$ROOT/go/src/github.com/moonfruit/***"
	"--include=/$ROOT/go/src/github.com/pentaglobal/***"
	"--exclude=/$ROOT/go/src/**"
	"--exclude=/$ROOT/env/.git/modules"
)

mapfile -t -O ${#ARGS[@]} ARGS < <(
	$SED -n 's|	*path = \(.*\)|--exclude=/'"$ROOT"'/env/\1/|p' "$WORKSPACE/env/.gitmodules")

echo "-------- Rsync Start at $(date) --------"
"$RSYNC" "${ARGS[@]}" "$WORKSPACE" "$DEST"
echo "-------- Rsync End at $(date) --------"
