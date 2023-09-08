#!/bin/bash

[[ -z $__ENV_LIB_FS ]] && __ENV_LIB_FS=1 || return

source "$ENV/lib/bash/native.sh"

create-temp-directory() {
    local prefix
    local temp
    prefix=$(simple-basename "$0")
    if temp=$(mktemp -d -t "$prefix.$1"); then
        if mkdir -p "$temp"; then
            trap-add "rm -fr '$temp'" EXIT
            eval "$1='$temp'"
        fi
    fi
}

copy-if-diff() {
    local destination
    [[ -d "$2" ]] && destination="$2/$(simple-basename "$1")" || destination=$2
    if ! diff "$destination" "$1"; then
        cp "$1" "$destination"
        if [[ -n $3 ]]; then
            chmod "$3" "$destination"
        fi
    fi
}
