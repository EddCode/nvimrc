return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymaps = vim.keymap

    local on_attach = function(client, bufnr)
      keymaps.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
      keymaps.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definitions" })
      keymaps.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
      keymaps.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "show LSP Type Definitions" })
      keymaps.set("n", "<leader>D", "<cmd>Telescope diagnostic bufnr=0<CR>", { desc = "Show buffer diagnostics" })
      keymaps.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show LSP code actions" })
      keymaps.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Show LSP rename" })
      keymaps.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
      keymaps.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      keymaps.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      keymaps.set("n", "K", vim.lsp.buf.hover, { desc = "Show LSP signature help" })

      -- Enable formatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig['html'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['cssls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['eslint'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['ts_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    }

    lspconfig['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['emmet_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
    }

    lspconfig['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "go", "gomod" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      settings = {
        gopls = {
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
        },
      },
    }

    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
}
