#!/bin/bash

[[ -z ${__ENV_LIB_NATIVE:-} ]] && __ENV_LIB_NATIVE=1 || return

simple-basename() {
    case $1 in
    /) echo "/" ;;
    */) simple-basename "${1::-1}" ;;
    *) echo "${1##*/}" ;;
    esac
}

simple-dirname() {
    case $1 in
    /) echo "/" ;;
    */) simple-dirname "${1::-1}" ;;
    */*)
        local dir="${1%/*}"
        [[ -z "$dir" ]] && echo "/" || echo "$dir"
        ;;
    *) echo "." ;;
    esac
}

current-script-directory() {
    to-absolute-path "$(simple-dirname "${BASH_SOURCE[1]}")"
}

main-script-directory() {
    to-absolute-path "$(simple-dirname "${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]}")"
}

to-absolute-path() {
    if [[ $1 = '.' ]]; then
        echo "$PWD"
    elif [[ $1 = '..' ]]; then
        simple-dirname "$PWD"
    elif [[ $1 = './'* ]]; then
        echo "$PWD/${1:2}"
    elif [[ $1 = '../'* ]]; then
        echo "$(simple-dirname "$PWD")/${1:3}"
    else
        realpath "$1"
    fi
}

trap-add() {
    local cmd=$1
    shift

    local sigspec
    for sigspec in "$@"; do
        trap -- "$(
            # shellcheck disable=SC2317
            extract() { [[ -n "$3" ]] && printf '%s\n' "$3"; }
            eval "extract $(trap -p "$sigspec")"
            printf '%s\n' "$cmd"
        )" "$sigspec" || return $?
    done
}

vartype() {
    local variable
    if ! variable=$(declare -p "$1" 2>/dev/null); then
        echo "NULL"
        return 1
    fi
    while [[ $variable =~ ^declare\ -n\ [^=]+=\"([^\"]+)\"$ ]]; do
        variable=$(declare -p "${BASH_REMATCH[1]}")
    done

    case ${variable#declare -} in
    a*)
        echo "ARRAY"
        ;;
    A*)
        echo "MAP"
        ;;
    i*)
        echo "INTEGER"
        ;;
    *)
        echo "STRING"
        ;;
    esac
}

join-by() {
    local IFS="$1"
    shift
    echo "$*"
}
