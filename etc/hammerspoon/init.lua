local paths = require("paths")

---
--- Reload config on change
---
Reloader = hs.pathwatcher.new(paths.home .. "/.hammerspoon", hs.reload):start()

---
--- Enable ipc module for `hs`
---
hs.ipc.cliSaveHistory(true)

---
--- Prevent nustore from creating some folders
---
-- local nutstore = require("nutstore")
-- nutstore.watchDirectory(paths.home .. "/NutstoreCloudBridge")
-- nutstore.watchDirectory(paths.home .. "/Nutstore Files")

---
--- Quit tunnelblick when connect to gingkoo wifi
--
local tunnelblick = require("tunnelblick"):start()

---
--- Launch HSTracker when Hearthstone is launching
---
-- hs.application.enableSpotlightForNameSearches(true)
-- require("hearthstone"):start()

---
--- Launch gost for virtual machines
---
local parallels = require("parallels")
parallels.forAddress("10.211.55.2", 7890, 10002):start()

--- Launch local server
local localserver = require("localserver")
localserver.new("127.0.0.1"):start()
