#!/bin/bash

[[ -z $__ENV_LIB_GITHUB ]] && __ENV_LIB_GITHUB=1 || return

source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

find-latest-release-url() {
    local expression
    if [[ -z $3 ]]; then
        expression="first(.assets[].browser_download_url)"
    else
        expression="first(.assets[].browser_download_url|select(endswith(\"$3\")))"
    fi
    curl "https://api.github.com/repos/$1/$2/releases/latest" | jq -r "$expression"
}

download-latest-release() {
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
    url=$(find-latest-release-url "$user" "$repo" "$suffix") || return
    [[ $url != "$last" ]] || return 0

    create-temp-file temp
    wget "$url" -O "$temp" || return

    rm -fr "$target"
    local type
    if type=$(extractable "$url"); then
        extract -rt "$type" "$temp" "$target"
    else
        mv -v "$temp" "$target"
    fi

    echo "$url" >"$last_file"
}

find-branch-commit() {
    curl "https://api.github.com/repos/$1/$2/branches/$3" | jq -r ".commit.sha"
}

download-branch() {
    local target=$1
    local user=$2
    local repo=$3
    local branch=$4

    local last_file
    last_file="$(simple-dirname "$target")/$(simple-basename "$target").commit"

    local last
    if [[ -f $last_file ]]; then
        last=$(cat "$last_file")
    fi

    local commit
    commit=$(find-branch-commit "$user" "$repo" "$branch") || return
    [[ $commit != "$last" ]] || return 0

    create-temp-file temp
    wget "https://github.com/$user/$repo/archive/refs/heads/$branch.zip" -O "$temp" || return

    rm -fr "$target"
    extract -rt "zip" "$temp" "$target"

    echo "$commit" >"$last_file"
}
