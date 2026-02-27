return {
  "williamboman/mason-lspconfig.nvim",
  build = ":MasonUpdate",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()

    vim.diagnostic.config({
      virtual_text = {
        prefix = " ",
        spacing = 4,
      },
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " "
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "eslint",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "emmet_ls",
        "jsonls",
      },
      automatic_installation = true,
    })
  end
}
