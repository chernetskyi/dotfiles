return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>n', function() require('oil').open() end, desc = 'Open parent directory' },
    },
    opts = {
      columns = {},
      skip_confirm_for_simple_edits = true,
      constrain_cursor = 'name',
    },
  },
}
