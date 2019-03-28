#!/usr/bin/env bash

# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

alias ls='ls -FGh'

alias ll='ls -l'
alias la='ls -A'
alias l='ll'
alias tree='tree -NF'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -H'
alias du='du -h'

alias ..='cd ..'
alias cd..='cd ..'

alias h="history | tail -58"
alias hist="history"

alias bash="SHELL=/usr/local/bin/bash /usr/local/bin/bash --login"
# alias diff="colordiff"
alias ldd="otool -L"
alias tmuxc="tmux -CC"

alias sl='sl -e'
alias LS='sl'
alias ls-='sl'

unalias grep

# vman() {
#    env PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
# vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
# -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
# -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\"" man $*
# }

# function dmalloc { eval `command dmalloc -b "$@"`; }
