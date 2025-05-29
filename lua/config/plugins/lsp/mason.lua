return {
  "williamboman/mason-lspconfig.nvim",
  build = ":MasonUpdate",
  dependencies = { "williamboman/mason.nvim" },
  config = function ()
    local mason = require("mason")
    local lspConfig = require("mason-lspconfig")

    mason.setup()

    lspConfig.setup({
      ensure_installed = {
        "gopls",
        "ts_ls",
        "eslint",
        "lua_ls",
        "jsonls",
        "html",
        "cssls"
      }
    })
  end
}
