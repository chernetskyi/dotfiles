return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>gb', function() require('gitsigns').toggle_current_line_blame() end, desc = 'Toggle current line git blame' },
  },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    numhl = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 500,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
  },
}
