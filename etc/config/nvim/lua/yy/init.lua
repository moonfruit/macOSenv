local M = {}

function M.remove_if(array, func)
    for i = #array, 1, -1 do
        if func(array[i]) then
            table.remove(array, i)
        end
    end
end

function M.remove_item(array, item)
    M.remove_if(array, function(value)
        return value == item
    end)
end

function M.remove_items(array, items)
    for _, item in ipairs(items) do
        M.remove_item(array, item)
    end
end

function M.list_to_set(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
    end
    for key, value in pairs(list) do
        if type(key) == "string" and value then
            set[key] = true
        end
    end
    return set
end

function M.remove_sources(sources, names)
    local name_set = M.list_to_set(names)
    M.remove_if(sources, function(source)
        return name_set[source.name] ~= nil
    end)
end

function M.replace_source(sources, name, source)
    for i, item in ipairs(sources) do
        if item.name == name then
            if vim.is_callable(source) then
                sources[i] = source(item)
            else
                sources[i] = source
            end
            return true
        end
    end
end

function M.replace_sources(sources, names, callback)
    for name, source in pairs(names) do
        if callback == nil then
            callback = function(_, s) return s end
        end
        M.replace_source(sources, name, callback(name, source))
    end
end

return M
