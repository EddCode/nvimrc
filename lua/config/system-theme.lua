-- Light/dark detection shared by the colorscheme and :RefreshTheme.
--   macOS:   system appearance (AppleInterfaceStyle)
--   Omarchy: `mode` of the current theme (colors.toml)
local M = {}

local omarchy_current = (vim.env.XDG_STATE_HOME or vim.fn.expand('~/.local/state')) .. '/omarchy/current'

local function macos_mode()
  local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
  if not handle then return 'light' end

  local result = handle:read('*a')
  handle:close()

  return result:match('Dark') and 'dark' or 'light'
end

local function omarchy_mode()
  local file = io.open(omarchy_current .. '/theme/colors.toml')
  if not file then return nil end

  local content = file:read('*a')
  file:close()

  return ('\n' .. content):match('\nmode%s*=%s*"(%a+)"')
end

function M.is_omarchy()
  return vim.uv.fs_stat(omarchy_current) ~= nil
end

function M.mode()
  if vim.fn.has('mac') == 1 then return macos_mode() end

  return omarchy_mode() or 'dark'
end

function M.apply()
  local mode = M.mode()

  if mode == 'light' then
    vim.cmd('colorscheme github_light_default')
  else
    vim.cmd('colorscheme github_dark_dimmed')
  end

  return mode
end

-- Omarchy swaps the whole theme directory when the theme changes, so watch
-- its parent and re-apply once the new colors.toml has settled.
function M.watch_omarchy()
  if not M.is_omarchy() then return end

  local last_mode = M.mode()
  local timer = vim.uv.new_timer()
  local watcher = vim.uv.new_fs_event()

  watcher:start(omarchy_current, {}, function()
    timer:stop()
    timer:start(500, 0, vim.schedule_wrap(function()
      local mode = omarchy_mode()
      if mode and mode ~= last_mode then
        last_mode = M.apply()
      end
    end))
  end)
end

return M
