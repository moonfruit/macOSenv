#!/usr/bin/zsh

# git
alias gau='git add -u'
compdef _git gau=git-add

alias grpo='git remote prune origin'

# autojump
[[ -f /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u

# proxy
compdef _precommand proxy

# add new Ignored User
zstyle -a ':completion:*:*:*:users' ignored-patterns _ignored_users
_ignored_users+=Guest
zstyle ':completion:*:*:*:users' ignored-patterns $_ignored_users

# for ssh
zstyle -e ':completion:*:my-accounts' users-hosts 'reply=($(cat ~/.ssh/save_hosts))'
