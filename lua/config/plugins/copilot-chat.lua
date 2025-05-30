local propmts = {
  Explain = "Explain how the following code works in detail.",
  Review = "Review the following code, provide feedback and suggestions for improvement.",
  Test = "Explain how the following code works and generate unit tests for it.",
  Refactor = "Refactor the following code to improve its clarity, performance and readability.",
  FixCode = "Fix the following code to resolve any issues or errors and make it works as intended",
  BetterNaming = "Suggest better variable and function names for the following code.",
  Documentation = "Generate documentation for the following code, including function descriptions and usage examples.",
  Optimize = "Optimize the following code for better performance and efficiency.",
  -- Text prompts
  Summarize = "Summarize the following text in a concise manner.",
  Spelling = "Check the following text for spelling errors and suggest corrections.",
  Wording = "Suggest better wording for the following text to improve clarity and readability.",
  Context = "Rewrite the following text to make it more concise",
}

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      prompts = propmts,
      model = "gpt-4o",
      question_header = "  Ask Copilot ",
      answer_header = "  Copilot ",
      auto_insert_mode = true,
      window = {
        width = 0.3,
      },
    },
    keys = {
      { "<leader>ac", ":CopilotChat<CR>",         mode = "n", desc = "CopilotChat - Open chat" },
      { "<leader>ae", ":CopilotChatExplain<CR>",  mode = "v", desc = "CopilotChat - Explain code" },
      { "<leader>ar", ":CopilotChatReview<CR>",   mode = "v", desc = "CopilotChat - Review code" },
      { "<leader>aR", ":CopilotChatRefactor<CR>", mode = "v", desc = "CopilotChat - Refactor code" },
      { "<leader>af", ":CopilotChatFix<CR>",      mode = "v", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>ao", ":CopilotChatOptimize<CR>", mode = "v", desc = "CopilotChat - Optimize Code" },
      { "<leader>am", ":CopilotChatCommit<CR>",   mode = "n", desc = "CopilotChat - Generate commit message for all changes" },
      { "<leader>at", ":CopilotChatToggle<CR>",   mode = "n", desc = "CopilotChat - Toggle" },
      { "<leader>a?", ":CopilotChatModels<CR>",   mode = "n", desc = "CopilotChat - Select Models" },
      { "<leader>aa", ":CopilotChatAgents<CR>",   mode = "n", desc = "CopilotChat - Select Agents" },
      { "<leader>ap", ":CopilotChatPrompts<CR>",  mode = "n", desc = "CopilotChat - Select Agents" },
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>aa",
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
