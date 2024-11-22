return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          mason = false,
        },
        html = {
          mason = false,
        },
        lemminx = {},
      },
    },
  },
}
