return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gf<CR>", ":diffget //2<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gh<CR>", ":diffget //3<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gd<CR>", ":Gvdiffsplit<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gm<CR>", ":Gvdiffsplit!<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gu<CR>", ":diffupdate<CR>", { desc = "Git status" })


      vim.keymap.set("n", "<leader>G", ":G<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
      vim.keymap.set("n", "<leader>gl", ":Git pull", { desc = "Git pull" })
    end,
  },
  { "lewis6991/gitsigns.nvim" },
}
