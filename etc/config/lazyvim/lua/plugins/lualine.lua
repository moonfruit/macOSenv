local colors = {
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      vim.list_extend(opts.sections.lualine_x, {
        {
          "o:fileencoding",
          color = { fg = colors.yellow },
          cond = function()
            return vim.o.fileencoding ~= "utf-8"
          end,
        },
        {
          "fileformat",
          color = { fg = colors.red },
          cond = function()
            return vim.o.fileformat ~= "unix"
          end,
        },
      })
    end,
  }
}
