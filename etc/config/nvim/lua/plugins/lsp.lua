local nls = require("null-ls")

local function remove_if(array, func)
  for i = #array, 1, -1 do
    if func(array[i]) then
      table.remove(array, i)
    end
  end
end

local function replace_source(sources, name, source)
  for i, item in ipairs(sources) do
    if item.name == name then
      sources[i] = source
      return item
    end
  end
end

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- opts.log_level = vim.log.levels.TRACE
      opts.formatters_by_ft.fish = nil
      -- opts.formatters.fish_indent = nil
      opts.formatters.shfmt = {
        prepend_args = { "-i", "4" }
      }
    end,
    -- opts = {
      -- log_level = vim.log.levels.TRACE,
      -- formatters = {
        -- shfmt = {
          -- prepend_args = { "-i", "4" },
        -- },
      -- },
    -- },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          mason = false,
          settings = {
            bashIde = {
              shellcheckArguments = "--external-sources"
            }
          }
        },
        cssls = {
          mason = false,
        },
        html = {
          mason = false,
        },
        lemminx = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts.debug = true
      remove_if(opts.sources, function(source)
        return source.name == "fish" or source.name == "fish_indent"
      end)
      replace_source(opts.sources, "shfmt", nls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "4" }
      }))
    end,
  },
}
