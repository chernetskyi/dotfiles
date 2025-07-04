require('options')
require('config')
require('keymaps')
require('autocommands')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  rocks = { enabled = false },
  install = {
    colorscheme = { 'tokyonight-night' },
  },
  change_detection = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'tarPlugin',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
