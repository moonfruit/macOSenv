local paths = require("paths")

local M = {}

function M.new(interface)
    return hs.httpserver.hsminweb.new(paths.etc .. "/pac"):bonjour(false):interface(interface):port(7899)
        :allowDirectory(true)
end

return M
