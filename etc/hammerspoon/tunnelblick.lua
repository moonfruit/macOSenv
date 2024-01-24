local M = {}

function M.killTunnelblick()
    local app = hs.application.get("net.tunnelblick.tunnelblick")
    if app and app:isRunning() then
        print("Kill Tunnelblick " .. app:pid())
        app:kill()
    end
end

function M.killTunnelblickIfGingkoo(callback)
    local network = hs.wifi.currentNetwork()
    if network ~= nil then
        if callback then
            callback(network)
        end
        if string.find(network, "jinqiu") then
            M.killTunnelblick()
        end
    end
end

function M:start()
    if not self.timer then
        self.timer = hs.timer.new(3600, M.killTunnelblickIfGingkoo, true)
        self.timer:start()
    end
    if not self.wathcer then
        self.wathcer = hs.wifi.watcher.new(function(watcher, event, interface)
            M.killTunnelblickIfGingkoo(function(network)
                print(string.format("Connect to `%s`", network))
            end)
        end)
        self.wathcer:start()
    end
    return self
end

function M:stop()
    if self.timer then
        self.timer:stop()
        self.timer = nil
    end
    if self.wathcer then
        self.wathcer:stop()
        self.wathcer = nil
    end
    return self
end

return M
