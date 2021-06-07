#!/usr/bin/env zsh

# proxy
compdef _precommand proxy

# add new Ignored User
zstyle -a ':completion:*:*:*:users' ignored-patterns _ignored_users
_ignored_users+=Guest
zstyle ':completion:*:*:*:users' ignored-patterns $_ignored_users

# for ssh
zstyle -e ':completion:*:my-accounts' users-hosts 'reply=($(cat ~/.ssh/save_hosts))'

# for npm
function _npm_completion() {
  local si=$IFS
  compadd -- $(COMP_CWORD=$((CURRENT-1)) \
               COMP_LINE=$BUFFER \
               COMP_POINT=0 \
               npm completion -- "${words[@]}" \
               2>/dev/null)
  IFS=$si
}
compdef _npm_completion npm

# for pip
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
compctl -K _pip_completion pip3
