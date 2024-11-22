local function disable_mason(servers, names)
  for _, name in ipairs(names) do
    local server = servers[name]
    if server then
      server.mason = false
    end
  end
end

local function remove(array, item)
  for i = #array, 1, -1 do
    if array[i] == item then
      table.remove(array, i)
    end
  end
end

local function remove_all(array, items)
  for _, item in ipairs(items) do
    remove(array, item)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      disable_mason(opts.servers, {
        -- C
        "clangd",
        -- Docker
        "dockerls",
        -- Go
        "gopls",
        -- Javascript
        "eslint",
        -- Json
        "jsonls",
        -- Kotlin
        "kotlin_language_server",
        -- Lua
        "lua_ls",
        -- Markdown
        "marksman",
        -- Python
        "pyright",
        "ruff",
        -- TOML
        "taplo",
        -- YAML
        "yamlls",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Docker
        "hadolint",
        -- Go
        "gofumpt",
        "gomodifytags",
        "impl",
        -- Javascript
        "biome",
        "prettier",
        -- Kotlin
        "ktlint",
        -- Lua
        "stylua",
        -- Markdown
        "markdown-toc",
        "markdownlint-cli2",
        -- Python
        "black",
        -- Shell
        "shellcheck",
        "shfmt",
        -- SQL
        "sqlfluff",
      })
    end,
  },
}
