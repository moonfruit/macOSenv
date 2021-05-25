local home <const> = os.getenv("HOME")

-- Reload config on change
hs.pathwatcher.new(home .. "/.hammerspoon", hs.reload):start()

-- Prevent create some directories
local trash <const> = home .. "/.Trash"

local function applescript(source, ...)
	result, _, descriptor = hs.osascript.applescript(string.format(source, ...))
	if result then
		return true;
	end
	description = descriptor["NSLocalizedDescription"]:gsub("\\U(....)", function(cp)
		return utf8.char(tonumber(cp, 16))
	end)
	return nil, description
end

local function removeDirectory(path)
	local result, error = hs.fs.rmdir(path)
	if result then
		hs.printf("Delete `%s` success", path)
	elseif error == "Directory not empty" then
		result, error = applescript([[
			tell application "Finder"
				move POSIX file "%s" to trash
			end tell
		]], path)
		if not result then
			print(error)
		end
	elseif error ~= "No such file or directory" then
		hs.printf("Delete `%s` failure, %s", path, error)
	end
end

local function watchDirectory(path)
	removeDirectory(path)
	hs.pathwatcher.new(path, function(paths, flags)
		for i, v in ipairs(paths) do
			if v == path then
				local itemIsDir = flags[i]["itemIsDir"]
				local itemCreated = flags[i]["itemCreated"]
				local itemRemoved = flags[i]["itemRemoved"]

				if itemIsDir and itemCreated and not itemRemoved then
					removeDirectory(v)
				end
			end
		end
	end):start()
end

watchDirectory(home .. "/NutstoreCloudBridge")
watchDirectory(home .. "/Nutstore Files")

-- Launch HSTracker when Hearthstone is launching
hs.application.enableSpotlightForNameSearches(true)

-- local events <const> = {
-- 	[hs.application.watcher.activated] = "activated",
-- 	[hs.application.watcher.deactivated] = "deactivated",
-- 	[hs.application.watcher.hidden] = "hidden",
-- 	[hs.application.watcher.launched] = "launched",
-- 	[hs.application.watcher.launching] = "launching",
-- 	[hs.application.watcher.terminated] = "terminated",
-- 	[hs.application.watcher.unhidden] = "unhidden",
-- }

local hstracker <const> = "/Applications/HSTracker.app"
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
