local colors = require("lvim.core.lualine.colors")

return {
    encoding = {
        "o:encoding",
        fmt = function(encoding)
            return encoding == "utf-8" and "" or encoding
        end,
        color = { fg = colors.red },
    },
    fileformat = {
        "fileformat",
        color = { fg = colors.green },
    },
}
