#!/bin/bash

[[ -z $__ENV_LIB_GITHUB ]] && __ENV_LIB_GITHUB=1 || return

source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

find-latest-url() {
    local expression
    if [[ -z $3 ]]; then
        expression="first(.assets[].browser_download_url)"
    else
        expression="first(.assets[].browser_download_url|select(endswith(\"$3\")))"
    fi
    curl "https://api.github.com/repos/$1/$2/releases/latest" | jq -r "$expression"
}

download-latest() {
    local target=$1
    local user=$2
    local repo=$3
    local suffix=$4

    local last_file
    last_file="$(simple-dirname "$target")/$(simple-basename "$target").url"

    local last
    if [[ -f $last_file ]]; then
        last=$(cat "$last_file")
    fi

    local url
    url=$(find-latest-url "$user" "$repo" "$suffix") || return
    [[ $url != "$last" ]] || return 0

    create-temp-file temp
    wget "$url" -O "$temp" || return

    rm -fr "$target"
    local type
    if type=$(extractable "$url"); then
        extract -rt "$type" "$temp" "$target"
    else
        mv "$temp" "$target"
    fi

    echo "$url" >"$last_file"
}
