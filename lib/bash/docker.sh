#!/bin/bash

[[ -z $__ENV_LIB_DOCKER ]] && __ENV_LIB_DOCKER=1 || return

find-image-latest-version() {
    skopeo list-tags "docker://$1" | jq -r '.Tags
    | map(select(test("^\\d+(\\.\\d+)+$")))
    | sort_by(split(".") | map(tonumber))
    | last'
}

find-alpine-package-version() {
    local package=$1
    local alpine=$2
    local category=${3:-"main"}
    local arch=${4:-"x86_64"}

    if [[ -z $alpine ]]; then
        local version
        version=$(find-image-latest-version alpine)
        alpine=${version%.*}
    fi

    local tar=$TMPDIR/alpine.v${alpine}.${category}.${arch}.tar.gz
    if [[ ! -f $tar ]] || (("$(stat -f %m "$tar")" < "$(date -v-1d +%s)")); then
        curl -fSL -o "$tar" "https://dl-cdn.alpinelinux.org/alpine/v${alpine}/${category}/${arch}/APKINDEX.tar.gz"
    fi

    tar -xzOf "$tar" |
        awk '$1 == "P:'"$package"'" { found = 1 }; found && $1 ~ /^V:/ { print substr($1, 3); exit }'
}
