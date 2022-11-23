#!/usr/bin/env bash

function exaf() {
	local extra
	if [[ $1 = '-lrt' ]]; then
		extra=-lsnew
		shift
	fi
	exa -gF --time-style long-iso --git $extra "$@"
}
function tree() {
	local extra=-T
	if [[ $1 = '-lrt' ]]; then
		extra=-Tlsnew
		shift
	fi
	exaf $extra "$@"
}
compdef _exa exaf tree

alias ls='exaf'

alias ll='ls -l'
alias la='ls -a'
alias l='ll'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -H'
alias du='du -h'

alias ..='cd ..'
alias cd..='cd ..'

alias h='history | tail -58'
alias hist='history'

alias bash='SHELL=/usr/local/bin/bash /usr/local/bin/bash --login'
# alias diff='colordiff'
alias ldd='otool -L'
alias tmuxc='tmux -CC'

alias sl='sl -e'
alias LS='sl'
alias ls-='sl'

alias gotop='gotop -c solarized -r 2s'
alias gpft='git push --follow-tags'
alias gpmf='git branch --show-current | xargs git push --set-upstream moonfruit'

alias fdi='fd -uu'
alias fdp='fd -p'
alias rgi='rg --no-ignore'

# vman() {
#    env PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
# vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
# -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
# -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\"" man $*
# }

# function dmalloc { eval `command dmalloc -b "$@"`; }
