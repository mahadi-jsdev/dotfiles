return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {},
    config = function()
      -- mason
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- mason lsp
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "tailwindcss",
          "html",
          "cssls",
        },
      })
    end,
  },
}
