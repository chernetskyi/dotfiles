require 'plugins'

-- Colors {{{
vim.cmd[[colorscheme nord]]
vim.cmd[[syntax enable]]
vim.opt.termguicolors = true
-- }}}

-- UI {{{
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.number = true
vim.opt.numberwidth = 1
vim.cmd[[
augroup toggle-numbers
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

vim.opt.list = true
vim.opt.listchars = 'tab:-->,space:·'

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmode = 'longest:full'
-- }}}

-- Indentation {{{
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- }}}

-- Folding {{{
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
-- }}}

-- Search {{{
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'nosplit'
vim.cmd[[
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]]
-- }}}

-- History {{{
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
-- }}}

-- Movement {{{
vim.opt.mouse = 'a'

vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})
-- }}}

-- Undo breakpoints {{{
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '{', '{<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '}', '}<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '[', '[<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', ']', ']<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '(', '(<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', ')', ')<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '<', '<<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '>', '><c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '=', '=<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', ':', ':<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', ';', ';<c-g>u', {noremap = true})
-- }}}

-- Misc {{{
vim.cmd[[filetype plugin indent on]]
vim.opt.hidden = true
vim.opt.modelines = 1

vim.cmd[[
augroup lua-highlight
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
]]
-- }}}

-- vim:foldmethod=marker:foldlevel=0
