return {
  -- Top Pickers & Explorer
  { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
  { "<leader>b",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<C-f>",           function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
  -- find
  { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  { "<C-p>",           function() Snacks.picker.files() end,                                   desc = "Find Files" },
  { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
  { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
  { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
  -- Grep
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
  { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
  -- search
  { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
  { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
  { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
  { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
  { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
  { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
  { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
  { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
  { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
  { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
  { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
  { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
  { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
  { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
  { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
  { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
  { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
  { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
  { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
  -- Git and GH
  { "<leader>sgb",      function() Snacks.git.blame_line() end,                                 desc = "Git Blame" },
  { "<leader>sgi",      function() Snacks.gh.issues() end,                                      desc = "GitHub Issues (open)" },
  { "<leader>sgI",      function() Snacks.gh.issues({ state = "all" }) end,                     desc = "GitHub Issues (all)" },
  { "<leader>sgp",      function() Snacks.gh.pull_requests() end,                               desc = "GitHub Pull Requests (open)" },
  { "<leader>sgP",      function() Snacks.gh.pull_requests({ state = "all" }) end,              desc = "GitHub Pull Requests (all)" },
  -- Other
  { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
  { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
  { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
  { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
  { "<leader>e",       function() Snacks.explorer() end,                                        desc = "File Explorer" },
  {
    "<leader>N",
    desc = "Neovim News",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      })
    end,
  }
}
