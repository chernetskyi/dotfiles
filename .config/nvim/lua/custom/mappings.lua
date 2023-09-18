local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<Esc>"] = "",
  },
}

M.general = {
  n = {
    ["V"] = { "v$", "Select till the end of the line" },
    ["J"] = { "mzJ`z", "Join lines without moving" },
    ["n"] = { "nzzzv", "Center the next match" },
    ["N"] = { "Nzzzv", "Center the previous match" },
    ["<C-d>"] = { "<C-d>zz", "Center page on scroll down" },
    ["<C-u>"] = { "<C-u>zz", "Center page on scroll up" },
    ["gf"] = { ":edit <cfile><cr>", "Open file under a cursor for editing" },
    ["q:"] = { ":q", "Common typo fix" },
  },
  v = {
    ["y"] = { "myy`y", "Yank without moving" },
    ["Y"] = { "myY`y", "Yank till the end of the line without moving" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected line up" },
  },
}

M.clipboard = {
  n = {
    ["<leader>d"] = { '"+d', "Delete to the clipboard" },
    ["<leader>D"] = { '"+D', "Delete till the end of the line to the clipboard" },
    ["<leader>y"] = { '"+y', "Yank to the clipboard" },
    ["<leader>Y"] = { '"+y$', "Yank till the end of the line to the clipboard" },
  },
  v = {
    ["<leader>d"] = { '"+d', "Delete to the clipboard" },
    ["<leader>y"] = { '"+y', "Yank to the clipboard" },
  },
}

return M
