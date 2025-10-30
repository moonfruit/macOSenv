#!/usr/bin/env bash
# shellcheck disable=SC1090

# claude
# alias claude='PATH=$PATH:$HOME/.local/bin claude'

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
# if (($+commands[fzf])); then
# 	export FZF_DEFAULT_OPTS=--cycle
# fi

# for zmv
autoload -U zmv
alias mmv='noglob zmv -W'

# for homebrew
export HOMEBREW_BAT=true
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=7
export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=7
export HOMEBREW_PRY=1
source "$ENV/etc/secret/homebrew.env"

local script=$BREW_PREFIX/Library/Homebrew/command-not-found/handler.sh
[[ -f "$script" ]] && . "$script"
unset script

# for maven
export MAVEN_OPTS="-Duser.language=en_us \
-Dstyle.debug=bold -Dstyle.info=blue -Dstyle.warning=yellow -Dstyle.error=red -Dstyle.success=green"
alias mvncc='mvn clean compile'
alias mvnccp='mvn clean compile -T1C'

# for java
export GINGKOO_ENV=dev

# for liquibase
local dir=$BREW_PREFIX/opt/liquibase/libexec
[[ -d "$dir" ]] && export LIQUIBASE_HOME=$dir
unset dir
