return {
  'stevearc/conform.nvim',
  opts = {},
  config = function ()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "eslint_d", "eslint", stop_after_first = true },
            typescript = { "eslint_d", "eslint", stop_after_first = true },
            javascriptreact = { "eslint_d", "eslint", stop_after_first = true },
            typescriptreact = { "eslint_d", "eslint", stop_after_first = true },
            python = { "ruff_format" },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            go = { "goimports", "gofmt" },
            astro = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",

        filter = function(client)
          local lsp_bloqueados = {
            ["ts_ls"] = true,
            ["html"] = true,
            ["cssls"] = true,
            ["jsonls"] = true,
            ["gopls"] = true,
            ["astro"] = true
          }

          if lsp_bloqueados[client.name] then
            return false
          end
          return true
        end
      }
    })
  end
}
