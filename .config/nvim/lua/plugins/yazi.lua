return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>-', '<cmd>Yazi<cr>', desc = 'Open yazi at the current file' },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
      yazi_floating_window_border = 'none',
      keymaps = { copy_relative_path_to_selected_files = nil },
    },
  },
}
