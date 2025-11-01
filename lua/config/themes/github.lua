local function is_light_mode()
  local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
  local result = handle:read('*a')
  handle:close()
  return result:match('Dark') == nil
end

return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  config = function()
    if is_light_mode() then
      vim.cmd('colorscheme github_light_default')
      return
    end
  end,
}
