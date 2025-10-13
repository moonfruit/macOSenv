#!/bin/bash

[[ -z ${__ENV_LIB_CONSOLE:-} ]] && __ENV_LIB_CONSOLE=1 || return

exec-if-dark() {
    if [[ -z $DARK_ENABLED && -t 1 ]] && hash it2check 2>/dev/null && it2check; then
        if ! hash it2profile 2>/dev/null || [[ $(it2profile -g) != dark ]]; then
            return
        fi
    fi
    exec "$@"
}

dark() {
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        WAIT=$1
        shift
    fi
    if [[ $# = 0 ]]; then
        exit 1
    fi

    if [[ -z $DARK_ENABLED ]] && hash it2check 2>/dev/null && hash it2profile 2>/dev/null && it2check; then
        profile=$(it2profile -g)
        if [[ $profile != dark ]]; then
            # shellcheck disable=SC2329
            on-exit() {
                it2profile -s "$profile"
            }
            trap on-exit EXIT
            it2profile -s dark
            export DARK_ENABLED=1
        fi
    else
        exec "$@"
    fi

    [[ -z $WAIT ]] && LEFT=$(date +%s)
    "$@"
    STATUS=$?
    if [[ -z $WAIT ]]; then
        LEFT=$((LEFT + 10 - $(date +%s)))
        [[ $LEFT -gt 0 ]] && WAIT=$LEFT || WAIT=0
    fi

    if [[ $WAIT -ge 0 ]]; then
        read -rsn1 -t "$WAIT"
    else
        read -rsn1
    fi
    exit $STATUS
}
