#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

if [[ $1 = "-f" || $1 = "--force" ]]; then
    FORCE=1
    shift
fi

REPO=$HOME/.m2/repository
download() {
    DIR=$PWD
    if [[ $DIR != $REPO/* ]]; then
        echo "                                            --- --- --- $DIR --- --- ---"
        echo "Not in $REPO"
        return 1
    fi
    DIR=${DIR#"$REPO/"}
    echo "                                            --- --- --- $DIR --- --- ---"

    IFS="/" read -r -a PARTS <<<"$DIR"
    JAR="${PARTS[-2]}-${PARTS[-1]}-sources.jar"

    [[ -n $FORCE ]] && rm "$JAR"
    wget -N "https://repo1.maven.org/maven2/$DIR/$JAR"
}

#readonly FZF=(fzf --cycle --multi)
readonly FZF=(sk --multi)

download-all() {
    fd -e jar | sed 's|/[^/]*$||' | sort -u | "${FZF[@]}" | while read -r line; do
        (cd "$line" && download)
    done
}

if [[ $# == 0 ]]; then
    if [[ $PWD != $REPO/* ]]; then
        cd "$REPO" || exit 1
        download-all
    elif [[ $PWD = "$REPO" ]]; then
        download-all
    else
        download
    fi
else
    while [[ $# -gt 0 ]]; do
        (cd "$1" && download)
        shift
    done
fi
