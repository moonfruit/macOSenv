local home<const> = os.getenv("HOME")
local env<const> = home .. "/Workspace.localized/env"
local etc<const> = env .. "/etc"

return {
    home = home,
    env = env,
    etc = etc
}
