-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("yy_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("text_wrap"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.filetype.add({
  extension = {
    pc = "esqlc",
    pom = "xml",
  },
})
