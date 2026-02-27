return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>a",  nil,                              desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "ClaudeCode" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "ClaudeCode Focus" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "ClaudeCode Resume" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "ClaudeCode Continue" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
