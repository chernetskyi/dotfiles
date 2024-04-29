return {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    {
      'nvimtools/none-ls.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-null-ls').setup({
      ensure_installed = {
        'stylua',
      },
      handlers = { function() end },
    })

    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.todo_comments,
        null_ls.builtins.diagnostics.trail_space,
        null_ls.builtins.formatting.terraform_fmt,

        null_ls.builtins.formatting.stylua.with({
          extra_args = { '--config-path', vim.fn.stdpath('config') }
        }),
      },
    })
  end,
}
