#!/usr/bin/env zsh

local script

# for thefuck
# eval $(thefuck --alias)

# for autojump
script=/usr/local/etc/profile.d/autojump.sh
[[ -f "$script" ]] && . "$script"

# for direnv
eval "$(direnv hook zsh)"

# for zmv
autoload -U zmv

# for brew
export HOMEBREW_AUTO_UPDATE_SECS=21600

# brew command-not-found (too slow)
# if brew command command-not-found-init > /dev/null 2>&1; then
#	eval "$(brew command-not-found-init)"
# fi
script=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
[[ -f "$script" ]] && . "$script"
