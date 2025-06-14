return {
  { "lukas-reineke/indent-blankline.nvim" },
  { "github/copilot.vim" },
  { "windwp/nvim-autopairs",              config = function() require("nvim-autopairs").setup() end },
  { "windwp/nvim-ts-autotag",             dependencies = { "nvim-treesitter/nvim-treesitter" } },
  {
    "folke/noice.nvim",
    events = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = "40%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      })
    end
  }
}
