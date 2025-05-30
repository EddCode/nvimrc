return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function()
    local picker = require('snacks.picker')
    local lspconfig = require("lspconfig")
    local cmp_lsp = require('cmp_nvim_lsp')

    local onAttach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap

      keymap.set("n", "gd", function() picker.lsp_definitions() end, opts)
      keymap.set("n", "gD", function() picker.lsp_declarations() end, opts)
      keymap.set("n", "gy", function() picker.lsp_type_definitions() end, opts)
      keymap.set("n", "gr", function() picker.lsp_references() end, opts)
      keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)  -- Show signature help
      keymap.set("n", "<leader>D", function() picker.diagnostics() end, opts) -- Show buffer diagnostics
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)           -- Show line diagnostics

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end

    local capabilities = cmp_lsp.default_capabilities()

    --lspconfig.ts_ls.setup({ on_attach = onAttach, capabilities = capabilities })
    lspconfig.eslint.setup({ on_attach = onAttach, capabilities = capabilities })

    lspconfig.cssls.setup({ on_attach = onAttach, capabilities = capabilities })
    lspconfig.html.setup({ on_attach = onAttach, capabilities = capabilities })

    lspconfig.gopls.setup({
      on_attach = onAttach,
      capabilities = capabilities,
      filetypes = { "go", "gomod" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      settings = {
        gopls = {
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
        },
      },
    })

    lspconfig.lua_ls.setup({
      on_attach = onAttach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim', 'Snacks' } }
        },
        telemetry = { enable = false }
      }
    })
  end
}
