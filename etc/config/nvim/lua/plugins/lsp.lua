local nls = require("null-ls")

local function remove_if(array, func)
  for i = #array, 1, -1 do
    if func(array[i]) then
      table.remove(array, i)
    end
  end
end

local function remove_sources(sources, names)
  remove_if(sources, function(source)
    return names[source.name] ~= nil
  end)
end

local function replace_source(sources, name, source)
  for i, item in ipairs(sources) do
    if item.name == name then
      sources[i] = source
      return item
    end
  end
end

local function replace_builtin(sources, name, opts)
  replace_source(sources, name, nls.builtins.formatting[name].with(opts))
end

local function replace_builtins(sources, names)
  for name, opts in pairs(names) do
    replace_builtin(sources, name, opts)
  end
end

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- opts.log_level = vim.log.levels.TRACE
      opts.formatters_by_ft.fish = nil
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          mason = false,
          settings = {
            bashIde = {
              shellcheckArguments = "--external-sources",
            },
          },
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
      remove_sources(opts.sources, { "fish", "fish_indent" })
      replace_builtins(opts.sources, {
        biome = {
          extra_args = { "--line-width=120" },
        },
        black = {
          extra_args = { "--line-length", "120" },
        },
        prettier = {
          extra_args = { "--print-width", "120" },
        },
        shfmt = {
          extra_args = { "--indent", "4" },
        },
      })
    end,
  },
}