local paths = require("paths")

local M = {}

function M.new(interface)
    local web = hs.httpserver.hsminweb.new(paths.etc .. "/pac")
    web:allowDirectory(true)
    web:bonjour(false)
    web:directoryIndex({ "index.html", "log.html" })
    web:interface(interface)
    web:port(7899)
    return web
end

return M
