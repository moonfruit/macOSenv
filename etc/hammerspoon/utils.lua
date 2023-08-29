local M = {}

function printTable(tbl, indent)
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            printTable(v, indent + 1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end

function M.printTable(tbl)
    printTable(tbl, 0)
end

function M.applescript(source, ...)
    result, _, descriptor = hs.osascript.applescript(string.format(source, ...))
    if result then
        return true;
    end
    description = descriptor["NSLocalizedDescription"]:gsub("\\U(....)", function(cp)
        return utf8.char(tonumber(cp, 16))
    end)
    return nil, description
end

function M.removeDirectory(path)
    local result, error = hs.fs.rmdir(path)
    if result then
        hs.printf("Delete `%s` success", path)
    elseif error == "Directory not empty" then
        result, error = M.applescript([[
			tell application "Finder"
				move POSIX file "%s" to trash
			end tell
		]], path)
        if not result then
            print(error)
        end
    elseif error ~= "No such file or directory" then
        hs.printf("Delete `%s` failure, %s", path, error)
    end
end

return M
