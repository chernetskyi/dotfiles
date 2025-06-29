return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = '1.*',
    opts = {
      cmdline = {
        completion = {
          menu = { auto_show = true },
        },
      },
      completion = {
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
    },
  },
}
