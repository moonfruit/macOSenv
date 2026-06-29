#!/usr/bin/env zsh
#
# cmux / ghostty shell integration tweaks:
#   1. Collapse cmux's duplicate per-surface shim dir in PATH (TMPDIR trailing
#      slash makes cmux inject the same dir twice; see below).
#   2. Ghostty SSH wrapper:
#      - Snapshot ghostty's built-in ssh() as ghostty-ssh and forward to it.
#      - Under cmux, rewrite GHOSTTY_BIN_DIR so ghostty's `+ssh-cache` finds the
#        real CLI (cmux exposes the GUI dir; the CLI lives in ../Resources/bin).
#      - Honor ~/.ssh/ghostty-blacklist (one zsh glob per line, `#` comments) to
#        skip the terminfo install attempt entirely on hosts that never accept it.

[[ "$TERM_PROGRAM" == "ghostty" ]] || return 0

# ── 1. cmux: dedup the shim dir in PATH + prune dead entries ────────────────
# macOS $TMPDIR carries a trailing slash (confstr DARWIN_USER_TEMP_DIR), and
# cmux injects the same shim dir two different ways: the GUI spawn prepends a
# standardized '…/T/cmux-cli-shims/<id>' while the zsh integration prepends a
# raw '…/T//cmux-cli-shims/<id>'. Same directory, different strings — cmux's
# own dedup and `typeset -U path` both compare strings, so both entries survive.
# We dedup by physical path (only the shim entries, keeping the frontmost one)
# and, while walking PATH, also drop empty and nonexistent directories.
# Must run AFTER cmux's _cmux_fix_path, which re-prepends the shim dir on the
# first precmd: gate on it still being queued and defer until it has run and
# removed itself, so we don't clean only to be re-polluted in the same prompt.
_yy_cmux_clean_path() {
    (( ${precmd_functions[(I)_cmux_fix_path]} )) && return 0  # let _cmux_fix_path run first
    local -a uniq
    local p key
    for p in $path; do
        [[ -n $p ]] || continue                                   # drop empty entries
        if [[ $p == *cmux-cli-shims* ]]; then key=${p:a}; else key=$p; fi
        [[ -d $key ]] || continue                                 # drop nonexistent dirs
        (( ${uniq[(Ie)$key]} )) || uniq+=$key                     # dedup by physical path
    done
    path=($uniq)
    add-zsh-hook -d precmd _yy_cmux_clean_path
}

if [[ -n "$CMUX_SURFACE_ID" || "$__CFBundleIdentifier" == "com.cmuxterm.app" ]]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _yy_cmux_clean_path
fi

# ── 2. Ghostty SSH wrapper ─────────────────────────────────────────────────
[[ "$GHOSTTY_SHELL_FEATURES" == *ssh-terminfo* ]] || return 0

_yy_ghostty_resolve_bin_dir() {
    local dir="${GHOSTTY_BIN_DIR%/}"
    if [[ "${dir##*/}" == "MacOS" && -x "${dir%/MacOS}/Resources/bin/ghostty" ]]; then
        print -r -- "${dir%/MacOS}/Resources/bin"
    else
        print -r -- "$dir"
    fi
}

_yy_ghostty_features_without_ssh_terminfo() {
    local -a parts
    parts=(${(s:,:)GHOSTTY_SHELL_FEATURES})
    parts=(${parts:#ssh-terminfo})
    print -r -- "${(j:,:)parts}"
}

_yy_ghostty_ssh_blacklisted() {
    local target="$1"
    local host="${target#*@}"
    local blacklist="${HOME}/.ssh/ghostty-blacklist"
    [[ -r "$blacklist" ]] || return 1
    local line candidate
    while IFS= read -r line; do
        line="${line## }"
        line="${line%% }"
        [[ -z "$line" || "$line" == \#* ]] && continue
        if [[ "$line" == *@* ]]; then
            candidate="$target"
        else
            candidate="$host"
        fi
        if [[ "$candidate" == ${~line} ]]; then
            return 0
        fi
    done < "$blacklist"
    return 1
}

_yy_ghostty_resolve_ssh_target() {
    local ssh_user ssh_hostname ssh_key ssh_value
    while IFS=' ' read -r ssh_key ssh_value; do
        case "$ssh_key" in
            user) ssh_user="$ssh_value" ;;
            hostname) ssh_hostname="$ssh_value" ;;
        esac
        [[ -n "$ssh_user" && -n "$ssh_hostname" ]] && break
    done < <(command ssh -G "$@" 2>/dev/null)
    [[ -n "$ssh_hostname" ]] || return 1
    print -r -- "${ssh_user}@${ssh_hostname}"
}

_yy_ghostty_ssh_install() {
    (( $+functions[_ghostty_precmd] )) || return 0
    (( $+functions[ssh] )) || return 0

    functions -c ssh ghostty-ssh

    ssh() {
        emulate -L zsh
        setopt local_options no_glob_subst

        local target=""
        target=$(_yy_ghostty_resolve_ssh_target "$@" 2>/dev/null) || target=""

        if [[ -n "$target" ]] && _yy_ghostty_ssh_blacklisted "$target"; then
            GHOSTTY_SHELL_FEATURES="$(_yy_ghostty_features_without_ssh_terminfo)" \
                ghostty-ssh "$@"
            return
        fi

        if [[ "${__CFBundleIdentifier:-}" == "com.cmuxterm.app" ]]; then
            GHOSTTY_BIN_DIR="$(_yy_ghostty_resolve_bin_dir)" ghostty-ssh "$@"
            return
        fi

        ghostty-ssh "$@"
    }

    add-zsh-hook -d precmd _yy_ghostty_ssh_install
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _yy_ghostty_ssh_install
