local terminals = {
	["com.apple.Terminal"] = true,
	["com.cmuxterm.app"] = true,
	["com.googlecode.iterm2"] = true,
	["com.mitchellh.ghostty"] = true,
	["com.neovide.neovide"] = true,
}

local M = {}

function M:start()
	if not self.watcher then
		self.watcher = hs.application.watcher.new(function(_, event, app)
			if event == hs.application.watcher.activated and app and terminals[app:bundleID()] then
				hs.keycodes.setLayout("ABC")
			end
		end)
		self.watcher:start()
	end
	return self
end

function M:stop()
	if self.watcher then
		self.watcher:stop()
		self.watcher = nil
	end
	return self
end

return M
