#!/bin/bash

[[ -z ${__ENV_LIB_FS:-} ]] && __ENV_LIB_FS=1 || return

source "$ENV/lib/bash/native.sh"

smart-diff() {
    if command -v delta &>/dev/null; then
        delta --paging=never "$@"
    else
        diff "$@"
    fi
}

create-temp-directory() {
    local -n _variable=$1
    local _prefix
    local _temp
    _prefix=$(simple-basename "$0")
    if _temp=$(mktemp -d -t "$_prefix.$1"); then
        trap-add "rm -fr '$_temp'" EXIT
        _variable=$_temp
    fi
}

create-temp-file() {
    local -n _variable=$1
    local _prefix
    local _temp
    _prefix=$(simple-basename "$0")
    if _temp=$(mktemp -t "$_prefix.$1"); then
        trap-add "rm -f '$_temp'" EXIT
        _variable=$_temp
    fi
}

copy-if-diff() {
    local destination
    [[ -s "$1" ]] || return
    [[ -d "$2" ]] && destination="$2/$(simple-basename "$1")" || destination=$2

    smart-diff "$destination" "$1" && return
    cp -pv "$1" "$destination" || return

    (($# > 2)) || return
    shift 2
    "$@" "$destination"
}

copy-if-exists() {
    [[ -f "$1" ]] && cp -pv "$1" "$2"
}

extractable() {
    case $1 in
    *.tar | *.tar.* | *.tgz | *.tbz | *.tbz2 | *.txz | *.tlz | *.tzst)
        echo "tar"
        ;;
    *.zip | *.war | *.jar | *.ear | *.sublime-package | *.ipa | *.ipsw | *.xpi | *.apk | *.aar | *.whl)
        echo "zip"
        ;;
    *)
        return 1
        ;;
    esac
}

extract() {
    local type
    local remove

    local opt
    OPTIND=1
    while getopts rt: opt; do
        case $opt in
        r) remove=1 ;;
        t) type=$OPTARG ;;
        *)
            echo "extract: unknown option: '$opt'" >&2
            return 1
            ;;
        esac
    done
    shift "$((OPTIND - 1))"

    local file=$1
    local dir=$2

    if [[ -z $type ]]; then
        type=$(extractable "$file")
    fi

    case $type in
    tar)
        mkdir -p "$dir" && gtar -xv -f "$file" -C "$dir"
        ;;
    zip)
        unzip "$file" -d "$dir"
        ;;
    *)
        echo "extract: unsupported file type: '$file'" >&2
        return 1
        ;;
    esac

    local files
    mapfile -t files < <(ls -1 "$dir")
    if (("${#files[@]}" == 1)); then
        local temp
        create-temp-directory temp
        # shellcheck disable=SC2154
        mv "$dir/${files[0]}" "$temp/singleton"
        rm -r "$dir"
        mv "$temp/singleton" "$dir"
        echo "$dir/${files[0]} -> $dir"
    fi

    if [[ -n $remove ]]; then
        rm -f "$file"
    fi
}
