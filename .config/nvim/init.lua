require('options')
require('keymaps')
require('autocommands')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git',
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  { import = 'plugins' },
  {
    install = {
      colorscheme = { 'rose-pine' },
    },
    ui = {
      icons = {
        cmd = '',
        config = '',
        event = '',
        favority = '',
        ft = '',
        init = '',
        import = '',
        keys = '',
        lazy = '',
        loaded = '●',
        not_loaded = '○',
        plugin = '',
        runtime = '',
        require = '',
        source = '',
        start = '',
        task = '',
        list = { '*', '+', '-' },
      },
    },
    performance = {
      rtp = {
        disabled_plugins = {
          'gzip',
          'matchit',
          'netrwPlugin',
          'tarPlugin',
          'tutor',
          'zipPlugin',
        },
      },
    },
  }
)
