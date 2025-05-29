return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    local fzf_lua = require("fzf-lua")

    vim.keymap.set("n", "<leader>fd", fzf_lua.lsp_definitions, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fr", fzf_lua.lsp_references, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ca", fzf_lua.lsp_code_actions, { noremap = true, silent = true })
  end
}
