-- local events <const> = {
-- 	[hs.application.watcher.activated] = "activated",
-- 	[hs.application.watcher.deactivated] = "deactivated",
-- 	[hs.application.watcher.hidden] = "hidden",
-- 	[hs.application.watcher.launched] = "launched",
-- 	[hs.application.watcher.launching] = "launching",
-- 	[hs.application.watcher.terminated] = "terminated",
-- 	[hs.application.watcher.unhidden] = "unhidden",
-- }

local hstracker <const> = "net.hearthsim.hstracker"
local hearthstone <const> = "unity.Blizzard Entertainment.Hearthstone"
hs.application.watcher.new(function(name, event, app)
	if event == hs.application.watcher.launching then
		-- print(app:bundleID())
		if app:bundleID() == hearthstone then
			hs.application.open(hstracker)
			hs.timer.doAfter(1, function() app:activate() end)
		end
	end
end):start()
