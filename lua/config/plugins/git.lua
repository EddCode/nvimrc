return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gu", ":diffupdate<CR>", { desc = "Git status" })


      vim.keymap.set("n", "<leader>G", ":G<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
      vim.keymap.set("n", "<leader>gl", ":Git pull", { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gb", ":Git blame", { desc = "Git blame" })
    end,
  },
  { "lewis6991/gitsigns.nvim" },
}
