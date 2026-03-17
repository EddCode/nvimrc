local function get_system_theme()
  local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
  if not handle then return 'light' end

  local result = handle:read('*a')
  handle:close()

  return result:match('Dark') and 'dark' or 'light'
end

vim.api.nvim_create_user_command('RefreshTheme', function()
  local theme_mode = get_system_theme()

  if theme_mode == 'light' then
    vim.cmd('colorscheme github_dark_dimmed')
  else
    vim.cmd('colorscheme github_dark_dimmed')
  end

  vim.notify('Theme refreshed: ' .. theme_mode .. ' mode', vim.log.levels.INFO)
end, {
  desc = 'Refresh theme based on system appearance'
})

vim.keymap.set('n', '<leader>rt', ':RefreshTheme<CR>', { desc = 'Refresh Theme' })
