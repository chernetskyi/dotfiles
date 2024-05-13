vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'gf', ':edit <cfile><cr>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

vim.keymap.set('x', '<leader>p', '"_dhp')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>D', '"+D')

vim.keymap.set('', 'j', function() return vim.v.count == 0 and 'gj' or 'j' end, { expr = true })
vim.keymap.set('', 'k', function() return vim.v.count == 0 and 'gk' or 'k' end, { expr = true })

vim.keymap.set('n', '<tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-tab>', ':bprev<CR>')

vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>', { silent = true })

vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end)
