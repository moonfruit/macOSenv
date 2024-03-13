#!/bin/bash

[[ -z $__ENV_LIB_CONSOLE ]] && __ENV_LIB_CONSOLE=1 || return

exec-if-dark() {
    if [[ -z $DARK_ENABLED && -t 1 ]] && hash it2check 2>/dev/null && it2check; then
        if ! hash it2profile 2>/dev/null || [[ $(it2profile -g) != dark ]]; then
            return
        fi
    fi
    exec "$@"
}
