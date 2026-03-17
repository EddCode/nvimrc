return {
  notifier = { enabled = true },
  indent = { enabled = true },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        layout = { layout = { position = "right" }},
        jump = { close = true },
      }
    }
  },
  dashboard = { examples = "doom" },
  lazygit = {
    enabled = true,
    configure = true,
    config = {
      os = { editPreset = "nvim-remote" },
      keybinding = {
        universal = {
          edit = "o",
          openFile = "<disabled>",
        },
      },
    },
  },
  gh = { enabled = true },
  explorer = {
    enabled = true,
    replace_netrw = true,
    trash = true,
    git_status = true,
  },
}
