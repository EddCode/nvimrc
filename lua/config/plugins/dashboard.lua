local logo = [[
 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

logo = string.rep("\n", 4) .. logo .. "\n"

return {
  'nvimdev/dashboard-nvim',
  lazy = false,
  event = 'VimEnter',
  opts = {
    theme = 'doom',
    config = {
      header = vim.split(logo, '\n'),
      center = {
        {
          icon = '  ',
          desc = 'Recently opened files',
          action = 'Telescope oldfiles',
          key = 'r',
        },
        {
          icon = '  ',
          desc = 'Find File',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          icon = '  ',
          desc = 'File Browser',
          action = 'NvimTreeToggle',
          key = 'e',
        },
        {
          icon = '  ',
          desc = 'Find Word',
          action = 'Telescope live_grep',
          key = 'w',
        },
        {
          icon = '  ',
          desc = 'Open Config',
          action = 'lua require("utils").open_config()',
          key = 'c',
        },
      },
      footer = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return {"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"}
      end,
    }
  }
}
