require 'plugins'

-- Colors {{{
vim.opt.termguicolors = true
-- }}}

-- UI {{{ 
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.showmode = false

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
vim.opt.undofile = true
vim.opt.writebackup = false
-- }}}

-- Key mappings {{{
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})

vim.api.nvim_set_keymap('n', 'gf', ':edit <cfile><cr>', {noremap = true})

vim.api.nvim_set_keymap('n', 'V', 'v$', {noremap = true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

vim.api.nvim_set_keymap('v', 'y', 'myy`y', {noremap = true})
vim.api.nvim_set_keymap('v', 'Y', 'myY`y', {noremap = true})

vim.cmd[[
  noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
  noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
]]

local breakpoints = {'.', ',', '!', '?', '{', '}', '[', ']', '(', ')', '<', '>', '=', ':', ':'}
for _, breakpoint in ipairs(breakpoints) do
  vim.api.nvim_set_keymap('i', breakpoint, breakpoint .. '<c-g>u', {noremap = true})
end

local arrows = {'<Up>', '<Down>', '<Left>', '<Right>'}
for _, arrow in ipairs(arrows) do
  vim.api.nvim_set_keymap('', arrow, '', {noremap = true})
  vim.api.nvim_set_keymap('i', arrow, '', {noremap = true})
end
-- }}}

-- Misc {{{
vim.opt.confirm = true
vim.opt.modelines = 1
vim.opt.mouse = 'a'
vim.cmd[[
  augroup lua-highlight
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
]]
-- }}}

-- vim:foldmethod=marker:foldlevel=0
