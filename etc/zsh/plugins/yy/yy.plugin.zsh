#!/usr/bin/env zsh

# proxy
compdef _precommand proxy

# add new Ignored User
zstyle -a ':completion:*:*:*:users' ignored-patterns _ignored_users
_ignored_users+=Guest
zstyle ':completion:*:*:*:users' ignored-patterns $_ignored_users

# for ssh
zstyle -e ':completion:*:my-accounts' users-hosts 'reply=($(cat ~/.ssh/save_hosts))'
