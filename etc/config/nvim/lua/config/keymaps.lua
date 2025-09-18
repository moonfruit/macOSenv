-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local modes = {
  normal = "n",
  select = "s",
  visual = "v",
  visual_only = "x",
  operator_pending = "o",
  insert = "i",
  command_line = "c",
  terminal = "t",
}

local default_opts = {
  noremap = true,
  silent = true,
}

local function set_keymap(mode, key, command)
  local cmd, opts
  if type(command) == "table" then
    cmd = command[1]
    opts = vim.tbl_extend("keep", command["opts"] or {}, default_opts)
  else
    cmd = command
    opts = default_opts
  end
  vim.keymap.set(modes[mode], key, cmd, opts)
end

local function set_keymaps(keymaps)
  for mode, maps in pairs(keymaps) do
    for key, command in pairs(maps) do
      set_keymap(mode, key, command)
    end
  end
end

set_keymaps({
  normal = {
    ["<Leader>z"] = "<Cmd>set wrap!<CR>",
    ["<M-A>a"] = "ggVG",
    ["<M-A>s"] = "<Cmd>up<CR>",
    ["<M-A>z"] = "u",
    ["<M-A>Z"] = "<C-R>",
    ["<Leader>W"] = { "<Cmd>noa w<CR>", opts = { desc = "Save without formatting" } },
  },
  visual = {
    ["<M-A>c"] = '"+y',
  },
  insert = {
    ["<M-A>s"] = "<C-o><Cmd>up<CR>",
  },
})

if vim.g.neovide then
  set_keymaps({
    normal = {
      ["<D-a>"] = "ggVG",
      ["<D-s>"] = "<Cmd>up<CR>",
      ["<D-v>"] = '"+p',
      ["<D-z>"] = "u",
      ["<S-D-z>"] = "<C-R>",
    },
    visual = {
      ["<D-c>"] = '"+y',
    },
    insert = {
      ["<D-s>"] = "<C-o><Cmd>up<CR>",
      ["<D-v>"] = '<C-o>"+p',
    },
  })
end
