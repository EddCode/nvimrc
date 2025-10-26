return {
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
      --vim.cmd.colorscheme "catppuccin-frappe"
    else
      --vim.cmd.colorscheme "catppuccin-latte"
    end
  end
}
