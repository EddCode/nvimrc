local system_theme = require('config.system-theme')

vim.api.nvim_create_user_command('RefreshTheme', function()
  local theme_mode = system_theme.apply()

  vim.notify('Theme refreshed: ' .. theme_mode .. ' mode', vim.log.levels.INFO)
end, {
  desc = 'Refresh theme based on system appearance'
})

vim.keymap.set('n', '<leader>rt', ':RefreshTheme<CR>', { desc = 'Refresh Theme' })

system_theme.watch_omarchy()
