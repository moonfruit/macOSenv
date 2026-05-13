#!/usr/bin/env zsh
#
# Ghostty SSH wrapper:
#   - Snapshot ghostty's built-in ssh() as ghostty-ssh and forward to it.
#   - Under cmux, rewrite GHOSTTY_BIN_DIR so ghostty's `+ssh-cache` finds the
#     real CLI (cmux exposes the GUI dir; the CLI lives in ../Resources/bin).
#   - Honor ~/.ssh/ghostty-blacklist (one zsh glob per line, `#` comments) to
#     skip the terminfo install attempt entirely on hosts that never accept it.

[[ "$TERM_PROGRAM" == "ghostty" ]] || return 0
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
    local blacklist="${HOME}/.ssh/ghostty-blacklist"
    [[ -r "$blacklist" ]] || return 1
    local line
    while IFS= read -r line; do
        line="${line## }"
        line="${line%% }"
        [[ -z "$line" || "$line" == \#* ]] && continue
        if [[ "$target" == ${~line} ]]; then
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
