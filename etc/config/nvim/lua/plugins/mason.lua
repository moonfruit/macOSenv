-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

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

---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Lua
        "lua_ls",
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Lua
        "stylua",
        "selene",
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Lua
        "lua-language-server",
        "stylua",
        "selene",
      })
    end,
  },
}
