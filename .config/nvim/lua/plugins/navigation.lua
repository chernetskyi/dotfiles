return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash jump',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump({ pattern = vim.fn.expand('<cword>') })
        end,
        desc = 'Flash jump to the word under cursor',
      },
    },
    opts = {
      jump = { autojump = true },
      modes = {
        char = { enabled = false },
      },
    },
  },
}
