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
      autopairs = true,     -- enable autopairs at start
      cmp = true,           -- enable completion at start
      diagnostics = true,   -- diagnostic settings on startup
      highlighturl = true,  -- highlight URLs at start
      notifications = true, -- enable notifications at start
      large_buf = {         -- set global limits for large files for disabling features
        size = 1024 * 1024 * 10,
        lines = 10000,
        line_length = 1024,
      },
    },
    -- Configure diagnostics options (`:h vim.diagnostic.config()`)
    diagnostics = {
      virtual_text = true,
      virtual_lines = { current_line = true },
      severity_sort = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        pc = "esqlc",
      },
      -- filename = {
      --   [".foorc"] = "fooscript",
      -- },
      -- pattern = {
      --   [".*/etc/foo/.*"] = "fooscript",
      -- },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "",
        colorcolumn = { 80, 120 },
        fileencodings = { "ucs-bom", "utf-8", "gb18030", "big5", "default", "latin1" },
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
      n = {
        ["<Leader>z"] = "<Cmd>set wrap!<CR>",

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
