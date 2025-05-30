return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/cmp-nvim-lsp',
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function ()
    local picker = require('snacks.picker')
    local lspconfig = require("lspconfig")
    local cmp_lsp = require('cmp_nvim_lsp')

    local onAttach = function (_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap

      --keymap.set("n", "gd", picker.lsp_definitions(), opts)
      --keymap.set("n", "gD", picker.lsp_declarations(), opts)
      --keymap.set("n", "gy", picker.lsp_type_definitions(), opts)
      --keymap.set("n", "gr", picker.lsp_references(), opts)
      --keymap.set("n", "<leader>ca", picker.lsp_code_actions(), opts)
      --keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      --keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      --keymap.set("n", "D", vim.lsp.buf.hover, opts)
      --keymap.set("n", "<leader>d", vim.lsp.buf.open_float, opts)
      --keymap.set("n", "<leader>rn", vim.lsp.buf.rename , opts)

    end

    local formatOnSave =  function (_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
          buffer= bufnr,
          callback = function ()
            vim.lsp.buf.format({ async = false })
          end
        })
    end

    local capabilities = cmp_lsp.default_capabilities()

    lspconfig.ts_ls.setup({ on_attach = onAttach, capabilities = capabilities })

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

    lspconfig.eslint.setup({ on_attach = formatOnSave })

    lspconfig.cssls.setup({ on_attach = onAttach, capabilities = capabilities })
    lspconfig.html.setup({ on_attach = onAttach, capabilities = capabilities })
    lspconfig.lua_ls.setup({
      on_attach = onAttach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = {'vim', 'Snacks'} }
        },
        telemetry = { enable = false }
      }
    })
  end
}
