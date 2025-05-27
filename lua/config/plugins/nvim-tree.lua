return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = "Toggle File Explorer" })
    require('nvim-tree').setup {
      view = {
        side = 'right',
        width = 50,
      },
      actions = {
        open_file = { quit_on_open = true }
      }
    }
  end
}
