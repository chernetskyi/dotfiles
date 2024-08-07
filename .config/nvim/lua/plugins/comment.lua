return {
  'numToStr/Comment.nvim',
  event = 'BufRead',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  config = function()
    require('ts_context_commentstring').setup({ enable_autocmd = false })
    require('Comment').setup({
      ignore = '^$',
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
