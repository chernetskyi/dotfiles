return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>-', function() require('oil').open() end, desc = 'Open parent directory' },
    },
    opts = {
      columns = {},
      constrain_cursor = 'name',
      skip_confirm_for_simple_edits = true,
    },
  },
}
