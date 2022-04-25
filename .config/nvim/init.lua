require 'plugins'

-- UI {{{ 
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.showmode = false
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.numberwidth = 1

local toggle_numbers_aug = vim.api.nvim_create_augroup('ToggleRelativeNumber', { clear = true })
vim.api.nvim_create_autocmd('InsertLeave', {group = toggle_numbers_aug, pattern = '*', callback = function() vim.opt.relativenumber = true end})
vim.api.nvim_create_autocmd('InsertEnter', {group = toggle_numbers_aug, pattern = '*', callback = function() vim.opt.relativenumber = false end})

vim.opt.list = true
vim.opt.listchars = {tab = '-->', space = '·'}

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmode = {'longest', 'full'}
-- }}}

-- Indentation {{{
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
-- }}}

-- Folding {{{
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
-- }}}

-- Search {{{
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

local toogle_search_aug = vim.api.nvim_create_augroup('ToogleIncSearchHighlight', { clear = true })
vim.api.nvim_create_autocmd('CmdLineEnter', {group = toogle_search_aug, pattern = '*', callback = function() vim.opt.hlsearch = true end})
vim.api.nvim_create_autocmd('CmdLineLeave', {group = toogle_search_aug, pattern = '*', callback = function() vim.opt.hlsearch = false end})
-- }}}

-- History {{{
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
-- }}}

-- Key mappings {{{
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`zz')

vim.keymap.set('n', 'gf', ':edit <cfile><cr>')

vim.keymap.set('n', 'V', 'v$')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

vim.keymap.set('', 'j', function() return vim.v.count == 0 and 'gj' or 'j' end, { expr = true })
vim.keymap.set('', 'k', function() return vim.v.count == 0 and 'gk' or 'k' end, { expr = true })

for _, breakpoint in ipairs({'.', ',', '!', '?', '{', '}', '[', ']', '(', ')', '<', '>', '=', ':', ':'}) do
  vim.keymap.set('i', breakpoint, breakpoint .. '<c-g>u')
end

for _, arrow in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
  vim.keymap.set({'', 'i'}, arrow, '')
end
-- }}}

-- Misc {{{
vim.opt.confirm = true
vim.opt.modelines = 1
vim.opt.mouse = 'a'

vim.api.nvim_create_autocmd('TextYankPost', {group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }), pattern = '*', callback = function() require('vim.highlight').on_yank() end})
-- }}}

-- vim:foldmethod=marker:foldlevel=0
