return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function ()
    local lspconfig = require("lspconfig")

    local onAttach = function (_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap

      keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      keymap.set("n", "gr", vim.lsp.buf.references, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "<leader>d", vim.lsp.buf.open_float, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    end

    local formatOnSave =  function ()
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
          buffer= bufnr,
          callback = function ()
            vim.lsp.buf.format({ async = false })
          end
        })
    end

    lspconfig.ts_ls.setup({ on_attach = onAttach })

    lspconfig.gopls.setup({ on_attach = onAttach })

    lspconfig.eslint.setup({ on_attach = formatOnSave })

    lspconfig.cssls.setup({})
    lspconfig.html.setup({})

  end
}
