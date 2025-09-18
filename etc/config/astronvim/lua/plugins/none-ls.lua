-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    opts.debug = true

    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Bash
      null_ls.builtins.formatting.shfmt.with {
        extra_args = { "--indent", "4" },
      },
      -- Docker
      null_ls.builtins.diagnostics.hadolint,
      -- Go
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.formatting.goimports,
      -- Lua
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.formatting.stylua,
      -- Kotlin
      null_ls.builtins.diagnostics.ktlint,
      -- Prettierd
      null_ls.builtins.formatting.prettier.with {
        extra_args = function(params)
          local args = { "--print-width", "120" }

          -- 如果 LSP 提供了 tabSize
          if params.options and params.options.tabSize then
            table.insert(args, "--tab-width")
            table.insert(args, tostring(params.options.tabSize))
          end

          -- 如果 LSP 提供了 insertSpaces
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
      -- SQL
      null_ls.builtins.diagnostics.sqlfluff,
      null_ls.builtins.formatting.sqlfluff,
      -- Swift
      null_ls.builtins.diagnostics.swiftlint,
      null_ls.builtins.formatting.swift_format,
    })

    -- vim.print(vim.inspect(opts.sources))
  end,
}
