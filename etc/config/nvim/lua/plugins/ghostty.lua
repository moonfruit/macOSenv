if vim.env.TERM_PROGRAM ~= "ghostty" then
    return {}
end

---@type LazySpec
return {
    name = "ghostty",
    dir = "/Applications/Ghostty.app/Contents/Resources/nvim/site",
    lazy = false,
}
