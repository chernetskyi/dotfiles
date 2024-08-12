-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable providers to cleanup :checkhealth
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Decrease update time
vim.opt.updatetime = 250

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.breakindent = true
vim.opt.linebreak = true

vim.opt.list = true
vim.opt.listchars = { tab = '-->', trail = '·', nbsp = '␣' }

vim.opt.diffopt:append('linematch:60')
vim.opt.laststatus = 3
vim.opt.scrolloff = 9
vim.opt.shortmess:append('I')
vim.opt.showmode = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Searching
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Misc
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.virtualedit = 'block'
