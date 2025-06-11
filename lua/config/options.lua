vim.g.mapleader = " "

vim.cmd("syntax on") -- Enable syntax highlighting

-- Basic options
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.redrawtime = 10000
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.history = 1000

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Enable filetype
vim.cmd("filetype indent plugin on")

-- Modify indenting settings
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false -- wrap line if it`s larger

-- Modify some other settings about files
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = true
-- vim.opt.invlist -- Esta opción no existe en Neovim, se ignora

-- Make statusline appear even with only single window.
vim.opt.laststatus = 1

-- highlight searchings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.keymap.set("n", "<C-q>", ":nohlsearch<CR>", { silent = true })

vim.opt.showmode = false
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.opt.showcmd = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.visualbell = true


local signs = {
  Warn = "⚠️",
  Error = "💩",
  Hint = "💡",
  Info = "👀",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    spacing = 4,
  },
  signs = true,
  underline = true,
})
