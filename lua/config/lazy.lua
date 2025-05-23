-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "config.plugins" },
    { import = "config.plugins.lsp" },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if not handle then
          vim.cmd.colorscheme "catppuccin-latte"
          return
        end

        local result = handle:read("*a")
        handle:close()

        result = result:gsub("%s+", "")

        if result == "Dark" then
          vim.cmd.colorscheme "catppuccin-frappe"
        else
          vim.cmd.colorscheme "catppuccin-latte"
        end
      end
    },
  },
  change_detection = { enabled = false },
  checker = { enabled = true, notify = false },
})
