return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = require("config.plugins.snacks.opts"),
  keys = require("config.plugins.snacks.keys"),
  init = require("config.plugins.snacks.init_fn"),
}
