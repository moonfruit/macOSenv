# for thefuck
eval $(thefuck --alias)

# for zmv
autoload -U zmv

# brew command-not-found (too slow)
# if brew command command-not-found-init > /dev/null 2>&1; then
#	eval "$(brew command-not-found-init)"
# fi
local handler=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
if [[ -f "$handler" ]]; then
	. "$handler"
fi
