-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

if not vim.env.PROXY_ENABLED then
    vim.env.http_proxy = "http://127.0.0.1:7890"
    vim.env.https_proxy = "http://127.0.0.1:7890"
end

local local_dir = vim.env.HOME .. "/.local"
vim.g.node_host_prog = local_dir .. "/node_modules/.bin/neovim-node-host"
vim.g.perl_host_prog = local_dir .. "/bin/perl"
vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"
vim.g.ruby_host_prog = local_dir .. "/bin/neovim-ruby-host"
