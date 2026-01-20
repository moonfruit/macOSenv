#!/bin/bash
# shellcheck disable=SC2155

[[ -z ${__ENV_LIB_COLOR:-} ]] && __ENV_LIB_COLOR=1 || return

readonly _BOLD=$(tput bold)
# readonly _RED=$(tput setaf 1)
readonly _GREEN=$(tput setaf 2)
# readonly _YELLOW=$(tput setaf 3)
readonly _BLUE=$(tput setaf 4)
# readonly _MAGENTA=$(tput setaf 5)
# readonly _CYAN=$(tput setaf 6)
# readonly _WHITE=$(tput setaf 7)
readonly _RESET=$(tput sgr0)

h1() {
    echo "$_GREEN==>$_RESET $_BOLD$*$_RESET"
}

h2() {
    echo "$_BLUE==>$_RESET $_BOLD$*$_RESET"
}
