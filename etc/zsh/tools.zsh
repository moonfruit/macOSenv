#!/usr/bin/env bash
# shellcheck disable=SC1090

unalias pip

# shellcheck disable=SC2168
local script

# for dmalloc
function dmalloc {
	eval "$(command dmalloc -b "$@")"
}

# for thefuck
# eval $(thefuck --alias)

# for autojump
script=/usr/local/etc/profile.d/autojump.sh
[[ -f "$script" ]] && . "$script"

# for direnv
eval "$(direnv hook zsh)"

# for hstr
# export HSTR_CONFIG=hicolor        # get more colors
# bindkey -s "\C-r" "\eqhstr\n"     # bind hstr to Ctrl-r

# for zmv
autoload -U zmv

# for brew
export HOMEBREW_AUTO_UPDATE_SECS=21600

# brew command-not-found (too slow)
#if brew command command-not-found-init > /dev/null; then
#	eval "$(brew command-not-found-init)"
#fi
script=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
[[ -f "$script" ]] && . "$script"

# for maven
export MAVEN_OPTS="-Xss2m -Dstyle.debug=bold -Dstyle.info=blue -Dstyle.warning=yellow -Dstyle.error=red -Dstyle.success=green"

# for fzf
export FZF_DEFAULT_COMMAND='rg --files'
