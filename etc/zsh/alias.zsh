#!/usr/bin/env bash

alias ll='ls -l'
alias la='ls -a'
alias l='ll'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -H'
alias du='du -h'

# alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias cd...='cd ../..'
alias 'cd-'='cd -'

alias h='history | tail -58'
alias hist='history'

alias bash="SHELL=$BREW_PREFIX/bin/bash $BREW_PREFIX/bin/bash --login"
alias ldd='otool -L'
alias tmuxc='tmux -CC'

alias sl='sl -e'
alias LS='sl'
alias ls-='sl'

alias gpft='git push --follow-tags'
alias gpmf='git branch --show-current | xargs git push --set-upstream moonfruit'

alias fdi='fd --unrestricted'
alias fdp='fd --full-path'
alias rgi='rg --no-ignore'
alias rgj='rg --type=java'
alias rgji='rg --type=java --ignore-case'

# alias gotop='gotop -c solarized -r 2s'

# vman() {
#    env PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
# vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
# -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
# -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\"" man $*
# }
