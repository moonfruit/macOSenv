#!/bin/bash

[[ -z $__ENV_LIB_JSON ]] && __ENV_LIB_JSON=1 || return

source "$ENV/lib/bash/native.sh"

as-json() {
    local -n variable=$1

    case $(vartype "$1") in
    STRING)
        echo "\"$variable\""
        ;;
    ARRAY)
        echo -n "["
        local item
        local first=1
        for item in "${variable[@]}"; do
            if [[ -n $first ]]; then
                first=
            else
                echo -n ","
            fi
            echo -n "\"$item\""
        done
        echo "]"
        ;;
    MAP)
        echo -n "{"
        local key
        local first=1
        for key in "${!variable[@]}"; do
            if [[ -n $first ]]; then
                first=
            else
                echo -n ","
            fi
            echo -n "\"$key\":\"${variable[$key]}\""
        done
        echo "}"
        ;;
    INTEGER)
        echo "$variable"
        ;;
    NULL)
        echo "null"
        ;;
    esac
}
