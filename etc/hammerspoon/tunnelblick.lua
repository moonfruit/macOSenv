local M = {}

function M:start()
    if not self.wathcer then
        self.wathcer = hs.wifi.watcher.new(function(watcher, event, interface)
            local network = hs.wifi.currentNetwork()
            print(string.format("Connect to `%s`", network))
            if network ~= nil and string.find(network, "jinqiu") then
                print("Quit Tunnelblick")
                hs.execute("/opt/homebrew/bin/tunblkctl quit", false)
            end
        end)
        self.wathcer:start()
    end
end

function M:stop()
    if self.wathcer then
        self.wathcer:stop()
        self.wathcer = nil
    end
    return self
end

return M
