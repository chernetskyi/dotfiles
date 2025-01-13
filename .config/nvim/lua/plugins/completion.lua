return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = 'v0.*',
    opts = {
      appearance = { use_nvim_cmp_as_default = true, },
      completion = {
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
      sources = {
        min_keyword_length = function()
          return vim.bo.filetype == 'markdown' and 2 or 0
        end,
      },
    },
    opts_extend = { 'sources.default' },
  },
}
