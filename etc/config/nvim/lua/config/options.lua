-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if not vim.env.PROXY_ENABLED then
  vim.env.http_proxy = "http://127.0.0.1:7890"
  vim.env.https_proxy = "http://127.0.0.1:7890"
end

local local_dir = vim.env.HOME .. "/.local"
vim.g.node_host_prog = local_dir .. "/node_modules/.bin/neovim-node-host"
vim.g.perl_host_prog = local_dir .. "/bin/perl"
vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"
vim.g.ruby_host_prog = local_dir .. "/bin/neovim-ruby-host"

if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font"
end

vim.opt.clipboard = ""
vim.opt.fileencodings = "ucs-bom,utf-8,gb18030,big5,default,latin1"
vim.opt.list = true
vim.opt.listchars = "tab:<->,trail:.,nbsp:+,extends:>,precedes:<"
vim.opt.shiftwidth = 4
vim.opt.spelllang = { "en", "cjk" }
vim.opt.tabstop = 4
