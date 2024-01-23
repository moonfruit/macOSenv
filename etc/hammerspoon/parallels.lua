local localserver = require("localserver")

local M = {}

local flagDescriptions<const> = {
    [hs.network.reachability.flags.transientConnection] = "transientConnection",
    [hs.network.reachability.flags.reachable] = "reachable",
    [hs.network.reachability.flags.connectionRequired] = "connectionRequired",
    [hs.network.reachability.flags.connectionOnTraffic] = "connectionOnTraffic",
    [hs.network.reachability.flags.interventionRequired] = "interventionRequired",
    [hs.network.reachability.flags.connectionOnDemand] = "connectionOnDemand",
    [hs.network.reachability.flags.isLocalAddress] = "isLocalAddress",
    [hs.network.reachability.flags.isDirect] = "isDirect"
}

local function flagsToString(flags)
    local result = "{";
    for k, v in pairs(flagDescriptions) do
        if (flags & k) > 0 then
            if #result > 1 then
                result = result .. ", "
            end
            result = result .. v
        end
    end
    return result .. "}"
end

local function asGostRoute(address, port)
    return {
        ServeNodes = {address .. ":" .. port},
        ChainNodes = {":" .. port}
    }
end

local function generateGostJson(file, address, ports)
    local json = asGostRoute(address, ports[1])
    if #ports > 1 then
        json.Routes = {}
        for i = 2, #ports do
            table.insert(json.Routes, asGostRoute(address, ports[i]))
        end
    end
    return hs.json.write(json, file)
end

function M.forAddress(address, ...)
    local gost = {
        address = address,
        ports = {...},
        start = function(self)
        end,
        stop = function(self)
        end,
        startGost = function(self)
        end,
        stopGost = function(self)
        end,
        startLocalServer = function(self)
        end,
        stopLocalServer = function(self)
        end
    }

    if #gost.ports == 0 then
        return gost
    end

    function gost.start(self)
        if not self.reachability then
            local callback = function(_, flags)
                print(self.address .. ": " .. flagsToString(flags))
                if (flags & hs.network.reachability.flags.isDirect) > 0 then
                    self:startGost()
                    self:startLocalServer()
                else
                    self:stopGost()
                    self:stopLocalServer()
                end
            end

            self.reachability = hs.network.reachability.forAddress(address)
            callback(self.reachability, self.reachability:status())
            self.reachability:setCallback(callback):start()
        end
        return self
    end

    function gost.stop(self)
        if self.reachability then
            self.reachability:stop()
            self.reachability = nil
        end
        self:stopGost()
        return self
    end

    function gost.startGost(self)
        if not (self.task and self.task:isRunning()) then
            self.config = hs.fs.temporaryDirectory() .. "gost-" .. hs.host.uuid() .. ".json"
            generateGostJson(self.config, self.address, self.ports)
            self.task = hs.task.new("/opt/homebrew/bin/gost", nil, {"-C", self.config}):start()
            print(string.format("Started gost(%s) -C %s", self.task:pid(), self.config))
        end
    end

    function gost.stopGost(self)
        if self.task and self.task:isRunning() then
            print(string.format("Terminating gost(%s)", self.task:pid()))
            self.task:terminate()
            self.task = nil
            os.remove(self.config)
            self.config = nil
        end
    end

    function gost.startLocalServer(self)
        if not self.server then
            self.server = localserver.new(self.address):start()
            print(string.format("Stated local server(%s)", self.address))
        end
    end

    function gost.stopLocalServer(self)
        if self.server then
            print(string.format("Terminating local server(%s)", self.address))
            self.server:stop()
            self.server = nil
        end
    end

    return gost
end

return M
