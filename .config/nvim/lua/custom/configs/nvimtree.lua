return {
  view = { signcolumn = "no" },
  renderer = {
    add_trailing = true,
    group_empty = true,
    root_folder_label = ":~:s?$?/..?",
    icons = {
      glyphs = {
        folder = {
          default = "",
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = { enable = false },
    },
  },
}
