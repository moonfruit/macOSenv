local hstracker<const> = "/Applications/HSTracker.app"
local hearthstone<const> = "unity.Blizzard Entertainment.Hearthstone"

local events<const> = {
    [hs.application.watcher.activated] = "activated",
    [hs.application.watcher.deactivated] = "deactivated",
    [hs.application.watcher.hidden] = "hidden",
    [hs.application.watcher.launched] = "launched",
    [hs.application.watcher.launching] = "launching",
    [hs.application.watcher.terminated] = "terminated",
    [hs.application.watcher.unhidden] = "unhidden"
}

local M = {}

function M:start()
    if not self.watcher then
        self.watcher = hs.application.watcher.new(function(name, event, app)
            if event == hs.application.watcher.launching or event == hs.application.watcher.launched then
                print(string.format("[%s] is <%s>", app:bundleID(), events[event]))
                if app:bundleID() == hearthstone then
                    hs.application.open(hstracker)
                    hs.timer.doAfter(1, function()
                        app:activate()
                    end)
                end
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
