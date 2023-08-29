local utils = require("utils")

local M = {}

function M.watchDirectory(path)
    utils.removeDirectory(path)
    hs.pathwatcher.new(path, function(paths, flags)
        for i, v in ipairs(paths) do
            if v == path then
                local itemIsDir = flags[i]["itemIsDir"]
                local itemCreated = flags[i]["itemCreated"]
                local itemRemoved = flags[i]["itemRemoved"]

                if itemIsDir and itemCreated and not itemRemoved then
                    utils.removeDirectory(v)
                end
            end
        end
    end):start()
end

return M
