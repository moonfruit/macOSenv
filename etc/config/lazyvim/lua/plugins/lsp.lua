local nls = require("null-ls")

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
        gradle_ls = {},
        groovyls = {},
        html = {
          mason = false,
        },
        lemminx = {
          settings = {
            maxLineWidth = 120,
          },
        },
        sorbet = {
          mason = false,
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts.debug = true
      replace_builtins(opts.sources, {
        biome = {
          extra_args = { "--line-width=120" },
        },
        black = {
          extra_args = { "--line-length", "120" },
        },
        prettier = {
          extra_args = function(params)
            local args = { "--print-width", "120" }

            -- 如果 LSP 提供了 tabSize
            if params.options and params.options.tabSize then
              table.insert(args, "--tab-width")
              table.insert(args, tostring(params.options.tabSize))
            end

            -- 如果 LSP 提供了是否用空格
            if params.options and params.options.insertSpaces ~= nil then
              if params.options.insertSpaces then
                table.insert(args, "--use-tabs=false")
              else
                table.insert(args, "--use-tabs=true")
              end
            end

            return args
          end,
        },
        shfmt = {
          extra_args = { "--indent", "4" },
        },
      })
    end,
  },
}
