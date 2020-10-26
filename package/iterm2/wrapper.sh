#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [[ -L $SOURCE ]]; do
	DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
CMD="$DIR/$(basename "$0")"
if [[ ! -f $CMD ]]; then
	if [[ -f $CMD.sh ]]; then
		CMD=$CMD.sh
	elif [[ -f $CMD.py ]]; then
		CMD=$CMD.py
	fi
fi

export DIRENV_LOG_FORMAT=
exec direnv exec "$CMD" "$@"
