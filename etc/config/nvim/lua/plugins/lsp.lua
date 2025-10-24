local nls = require("null-ls")
local yy = require("yy")

local function replace_builtins(sources, names)
  yy.replace_sources(sources, names, function(_, opts)
    return function(source)
      return source.with(opts)
    end
  end)
end

---@type LazySpec
return {
  { "mfussenegger/nvim-lint", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          settings = {
            bashIde = {
              shellcheckArguments = "--external-sources",
            },
          },
        },
        cspell_ls = {},
        gradle_ls = {},
        groovyls = {},
        lemminx = {
          settings = {
            xml = {
              format = {
                maxLineWidth = 120,
              },
            },
          },
        },
        marksman = {
          init_options = {
            format = {
              lineLength = 120,
            },
          },
        },
        ruff = {
          capabilities = {
            general = {
              positionEncodings = { "utf-16" },
            },
          },
          init_options = {
            settings = {
              lineLength = 120,
              lint = {
                preview = true,
              },
              format = {
                preview = true,
              },
            },
          },
        },
        sourcekit = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts.debug = true
      yy.remove_sources(opts.sources, {
        "fish",
        "fish_indent",
      })
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
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.selene,
        nls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", "ansi" },
        }),
        nls.builtins.diagnostics.swiftlint,
        nls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", "ansi" },
        }),
        nls.builtins.formatting.swift_format,
      })
    end,
  },
}
