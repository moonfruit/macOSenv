#!/usr/bin/env zsh

# proxy
compdef _precommand proxy

# add new Ignored User
zstyle -a ':completion:*:*:*:users' ignored-patterns _ignored_users
_ignored_users+=Guest
zstyle ':completion:*:*:*:users' ignored-patterns $_ignored_users

# for ssh
zstyle -e ':completion:*:my-accounts' users-hosts 'reply=($(cat ~/.ssh/save_hosts))'

# for brewd python3
local python3=/usr/local/opt/python/libexec/bin

function py3 {
    if echo $PATH | grep -Fq "$python3"; then
        echo python3
    else
        last_path="$PATH"
        export PATH="$python3:$PATH"
    fi
}

function py2 {
    export PATH=${PATH//$python3/}
}
