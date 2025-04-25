return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.load_extension('fzf')

    local keymap = vim.keymap

    keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
    keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap.set('n', '<leader>fg', builtin.grep_string, { desc = 'Telescope find string under cursos' })
    keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
  end
}
