-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },            -- set global limits for large files for disabling features like treesitter
      autopairs = true,                                            -- enable autopairs at start
      cmp = true,                                                  -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = true }, -- diagnostic settings on startup
      highlighturl = true,                                         -- highlight URLs at start
      notifications = true,                                        -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        pc = "esqlc",
      },
      -- filename = {
      -- [".foorc"] = "fooscript",
      -- },
      -- pattern = {
      -- [".*/etc/foo/.*"] = "fooscript",
      -- },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "",
        fileencodings = "ucs-bom,utf-8,gb18030,big5,default,latin1",
        guifont = "JetBrainsMono Nerd Font",
        list = true,
        listchars = "tab:<->,trail:.,nbsp:+,extends:>,precedes:<",
        number = true,
        relativenumber = true,
        signcolumn = "yes",
        spelllang = { "en", "cjk" },
        tabstop = 4,
        wrap = false,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the left hand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        ["<M-A>a"] = "ggVG",
        ["<M-A>s"] = "<Cmd>up<CR>",
        ["<M-A>z"] = "u",
        ["<M-A>Z"] = "<C-R>",
        ["<Leader>W"] = { "<Cmd>noa w<CR>", desc = "Save without formatting" },

        ["<D-a>"] = "ggVG",
        ["<D-s>"] = "<Cmd>up<CR>",
        ["<D-v>"] = '"+p',
        ["<D-z>"] = "u",
        ["<S-D-z>"] = "<C-R>",
      },
      v = {
        ["<M-A>c"] = '"+y',
        ["<D-c>"] = '"+y',
      },
      i = {
        ["<M-A>s"] = "<C-o><Cmd>up<CR>",
        ["<D-s>"] = "<C-o><Cmd>up<CR>",
        ["<D-v>"] = '<C-o>"+p',
      },
    },
  },
}
