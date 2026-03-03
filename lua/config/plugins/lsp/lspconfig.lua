return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymaps = vim.keymap

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      opts.desc = "Show LSP references"
      keymaps.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)

      opts.desc = "Go to definitions"
      keymaps.set("n", "gd", function() Snacks.picker.lsp_definitions() end, opts)

      opts.desc = "Show LSP implementations"
      keymaps.set("n", "gi", function() Snacks.picker.lsp_implementations() end, opts)

      opts.desc = "Show LSP Type Definitions"
      keymaps.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, opts)

      opts.desc = "Show buffer diagnostics"
      keymaps.set("n", "<leader>D", function() Snacks.picker.diagnostics_buffer() end, opts)

      opts.desc = "Show LSP code actions"
      keymaps.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Show LSP rename"
      keymaps.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

      opts.desc = "Show line diagnostics"
      keymaps.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Go to next diagnostic"
      keymaps.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Go to previous diagnostic"
      keymaps.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Show LSP signature help"
      keymaps.set("n", "K", vim.lsp.buf.hover, opts)

      -- Enable formatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local servers = { "html", "cssls", "pyright", "emmet_ls", "gopls", "ts_ls", "jsonls" }

    for _, lsp in ipairs(servers) do
      local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      if lsp == "gopls" then
        opts.settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
          },
        }
      end

      if lsp == "emmet_ls" then
        opts.filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" }
      end

      if vim.lsp.config and vim.lsp.enable then
        vim.lsp.config(lsp, opts)
        vim.lsp.enable(lsp)
      else
        -- Fallback for older Neovim versions
        require("lspconfig")[lsp].setup(opts)
      end
    end
  end
}
