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

local function set_keymap(mode, key, command)
  vim.keymap.set(modes[mode], key, command, {
    noremap = true,
    silent = true,
  })
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
    ["<M-A>a"] = "ggVG",
    ["<M-A>s"] = "<Cmd>up<CR>",
    ["<M-A>z"] = "u",
    ["<M-A>Z"] = "<C-R>",
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
