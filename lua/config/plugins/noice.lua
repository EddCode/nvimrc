return {
  "folke/noice.nvim",
  events = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("noice").setup()
  end
}
