local M = {}

function M.remove_if(array, func)
    for i = #array, 1, -1 do
        if func(array[i]) then
            table.remove(array, i)
        end
    end
end

function M.remove_sources(sources, names)
    M.remove_if(sources, function(source)
        return names[source.name] ~= nil
    end)
end

return M
