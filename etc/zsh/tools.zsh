#!/usr/bin/env bash
# shellcheck disable=SC1090

# for dmalloc
function dmalloc {
	eval "$(command dmalloc -b "$@")"
}

# for di
export DI_ARGS="-f sMbuvpt"

# for thefuck
# eval $(thefuck --alias)

# for direnv
# eval "$(direnv hook zsh)"

# for fzf
export FZF_DEFAULT_OPTS=--cycle

# for hstr
# export HSTR_CONFIG=hicolor        # get more colors
# bindkey -s "\C-r" "\eqhstr\n"     # bind hstr to Ctrl-r

# for zmv
autoload -U zmv
alias mmv='noglob zmv -W'

# for homebrew
export HOMEBREW_BAT=true
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=7

export HUB_REMOTE=moonfruit

local prefix="/opt/homebrew" # $(brew --prefix)
local script=${prefix}/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
[[ -f "$script" ]] && . "$script"
unset prefix script

# for maven
export MAVEN_OPTS="-Xss2m -Duser.language=en_us -Dstyle.debug=bold -Dstyle.info=blue -Dstyle.warning=yellow -Dstyle.error=red -Dstyle.success=green"

# for java
export GINGKOO_ENV=dev

# for liquibase
export LIQUIBASE_HOME=/opt/homebrew/opt/liquibase/libexec
