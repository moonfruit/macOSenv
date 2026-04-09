#!/bin/bash

[[ -z ${__ENV_LIB_CONSOLE:-} ]] && __ENV_LIB_CONSOLE=1 || return 0

source "$ENV/lib/bash/native.sh"

is-profile-solarized() {
    [[ $1 == default ]]
}

is-solarized() {
    [[ -z ${DARK_ENABLED:-} ]] && run-if-exists it2check && is-profile-solarized "$(run-if-exists it2profile -g)"
}

exec-solarized() {
    if is-solarized; then
        exec "$@" | solarized.sh
    else
        exec "$@"
    fi
}

exec-if-not-solarized() {
    if is-solarized; then
        return
    fi
    exec "$@"
}

dark() {
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        wait=$1
        shift
    else
        wait=10
    fi
    if (($# == 0)); then
        exit 1
    fi

    if [[ -z ${DARK_ENABLED:-} ]] && run-if-exists it2check && profile=$(run-if-exists it2profile -g) &&
        is-profile-solarized "$profile"; then

        # shellcheck disable=SC2329
        on-exit() {
            it2profile -s "$profile"
        }
        trap on-exit EXIT
        it2profile -s dark
        export DARK_ENABLED=1
    else
        export DARK_ENABLED=1
        exec "$@"
    fi

    ((wait > 0)) && time=$(date +%s)
    "$@"
    status=$?
    if ((wait > 0)); then
        wait=$((wait + time - $(date +%s)))
        ((wait < 0)) && wait=0
    fi

    if ((wait > 0)); then
        read -rsn1 -t "$wait"
    elif ((wait < 0)); then
        read -rsn1
    fi
    exit $status
}
