local colors = require("lvim.core.lualine.colors")

return {
    encoding = {
        "o:fileencoding",
        color = { fg = colors.yellow },
        cond = function()
            return vim.o.fileencoding ~= "utf-8"
        end,
    },
    fileformat = {
        "fileformat",
        color = { fg = colors.violet },
        cond = function()
            return vim.o.fileformat ~= "unix"
        end,
    },
}
