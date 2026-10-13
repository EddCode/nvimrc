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

    -- Keymaps live in LspAttach instead of `on_attach`: several servers (ts_ls,
    -- eslint, pyright) ship their own on_attach and ours would replace it.
    local on_attach = function(args)
      local opts = { noremap = true, silent = true, buffer = args.buf }

      -- nowait: Neovim's default grr/gri/gra/grn mappings would delay `gr`
      opts.nowait = true
      opts.desc = "Show LSP references"
      keymaps.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)
      opts.nowait = nil

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

    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("config_lsp_keymaps", { clear = true }),
      callback = on_attach,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local servers = { "html", "cssls", "ruff", "pyright", "emmet_ls", "gopls", "ts_ls", "jsonls", "eslint", "lua_ls", "astro" }

    for _, lsp in ipairs(servers) do
      local opts = {
        capabilities = capabilities,
      }

      if lsp == "pyright" then
        -- use the project's virtualenv when it has one
        opts.on_init = function(client)
          local python = (client.root_dir or vim.fn.getcwd()) .. "/.venv/bin/python"
          if vim.uv.fs_stat(python) then
            client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
              python = { pythonPath = python },
            })
          end
        end
      end

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
        opts.filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "astro" }
      end

      if lsp == "lua_ls" then
        opts.settings = {
           Lua = {
             diagnostics = {
               globals = { "vim" },
             },
             telemetry = { enable = false },
             workspace = {
               library = vim.api.nvim_get_runtime_file("", true),
               checkThirdParty = false,
             }
           }
        }
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
