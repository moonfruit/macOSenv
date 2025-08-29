-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

if not vim.env.PROXY_ENABLED then
    vim.env.http_proxy = "http://127.0.0.1:7890"
    vim.env.https_proxy = "http://127.0.0.1:7890"
end
