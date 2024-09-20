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
        if flags & k > 0 then
            if #result > 1 then
                result = result .. ", "
            end
            result = result .. v
        end
    end
    return result .. "}"
end

local function asService(id, address, port)
    return {
        name = "service-" .. id,
        addr = address .. ":" .. port,
        handler = {
            type = "http",
            chain = "chain-" .. id,
        },
        listener = {
            type = "tcp",
        },
    }
end

local function asChain(id, port)
    return {
        name = "chain-" .. id,
        hops = {{
            name = "hop-" .. id,
            nodes = {{
                name = "node-" .. id,
                addr = "127.0.0.1:" .. port,
                connector = {
                    type = "http"
                },
                dialer = {
                    type = "tcp"
                }
            }}
        }}
    }
end

local function asGost(address, ports)
    local config = {
        services = {},
        chains = {},
    }
    for i, port in ipairs(ports) do
        table.insert(config.services, asService(i, address, port))
        table.insert(config.chains, asChain(i, port))
    end
    return config
end

local function generateGostJson(address, ports)
    return hs.json.encode(asGost(address, ports), true)
end

local function writeToFile(filename, text)
    local file, err = io.open(filename, "w")
    if file then
        file:write(text)
        file:close()
    else
        error("Open file " + filename + " error: " + err)
    end
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
            local json = generateGostJson(self.address, self.ports)
            local hash = hs.hash.MD5(json)
            self.config = hs.fs.temporaryDirectory() .. "gost-" .. hash .. ".json"
            writeToFile(self.config, json)
            self.task = hs.task.new("/opt/homebrew/opt/gost@3/bin/gost", nil, {"-C", self.config}):start()
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
