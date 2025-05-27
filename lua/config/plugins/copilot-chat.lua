return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
    ft = { "markdown", "copilot-chat" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      window = {
        width = 0.3,
      },
      model = "gpt-4o",
      question_header = "  Ask Copilot ",
      answer_header = "  Copilot ",
      autocomplete = true, -- Enable tab autocompletion in the chat panel
    },
    keys = {
      { "<leader>cc", ":CopilotChat<CR>",         mode = "n", desc = "CopilotChat - Open chat" },
      { "<leader>ce", ":CopilotChatExplain<CR>",  mode = "v", desc = "CopilotChat - Explain code" },
      { "<leader>cr", ":CopilotChatReview<CR>",   mode = "v", desc = "CopilotChat - Review code" },
      { "<leader>cR", ":CopilotChatRefactor<CR>", mode = "v", desc = "CopilotChat - Refactor code" },
      { "<leader>cf", ":CopilotChatFix<CR>",      mode = "v", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>co", ":CopilotChatOptimize<CR>", mode = "v", desc = "CopilotChat - Optimize Code" },
      { "<leader>cm", ":CopilotChatCommit<CR>",   mode = "n", desc = "CopilotChat - Generate commit message for all changes" },
      { "<leader>ct", ":CopilotChatToggle<CR>",   mode = "n", desc = "CopilotChat - Toggle" },
      { "<leader>c?", ":CopilotChatModels<CR>",   mode = "n", desc = "CopilotChat - Select Models" },
      { "<leader>za", ":CopilotChatAgents<CR>",   mode = "n", desc = "CopilotChat - Select Agents" },
      {
        "<leader>ci",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>ca",
        function()
          local agent = vim.fn.input("Select Agent: ")
          local question = vim.fn.input("Ask Copilot (Agent Mode): ")
          if agent ~= "" and question ~= "" then
            vim.cmd("CopilotChatAgents " .. agent)
            vim.cmd("CopilotChat " .. question)
          end
        end,
        desc = "CopilotChat - Ask with Agent",
      },
    },
  },
}
