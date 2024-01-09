#!/usr/bin/env bash
# shellcheck disable=SC1090

# for dmalloc
if (($+commands[dmalloc])); then
	function dmalloc {
		eval "$(command dmalloc -b "$@")"
	}
fi

# for di
export DI_ARGS="-f sMbuvpt"

# for thefuck
# eval $(thefuck --alias)

# for direnv
# eval "$(direnv hook zsh)"

# for fzf
if (($+commands[fzf])); then
	export FZF_DEFAULT_OPTS=--cycle
fi

# for hstr
# export HSTR_CONFIG=hicolor        # get more colors
# bindkey -s "\C-r" "\eqhstr\n"     # bind hstr to Ctrl-r

# for zmv
autoload -U zmv
alias mmv='noglob zmv -W'

# for homebrew
export HOMEBREW_API_AUTO_UPDATE_SECS=3600
export HOMEBREW_AUTOREMOVE=true
export HOMEBREW_BAT=true
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=7
export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=7
export HOMEBREW_PRY=1

# export HUB_REMOTE=moonfruit

local script=$BREW_PREFIX/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
[[ -f "$script" ]] && . "$script"
unset script

# for maven
export MAVEN_OPTS="-Xss2m -Duser.language=en_us \
-Dstyle.debug=bold -Dstyle.info=blue -Dstyle.warning=yellow -Dstyle.error=red -Dstyle.success=green"

# for java
export GINGKOO_ENV=dev

# for liquibase
local dir=$BREW_PREFIX/opt/liquibase/libexec
[[ -d "$dir" ]] && export LIQUIBASE_HOME=$dir
unset dir
