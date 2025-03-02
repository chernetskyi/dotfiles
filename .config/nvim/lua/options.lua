-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable providers to cleanup :checkhealth
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Decrease update time
vim.o.updatetime = 250

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.title = true

vim.o.cursorline = true

vim.o.linebreak = true

vim.o.list = true
vim.opt.listchars = { tab = '-->', leadmultispace = '▎ ', trail = '·', nbsp = '␣' }

vim.o.laststatus = 3
vim.o.scrolloff = 4
vim.o.showmode = false

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- Searching
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Misc
vim.o.undofile = true
vim.o.virtualedit = 'block'
