local api = vim.api
local opt = vim.opt

opt.breakindent = true
opt.clipboard = ""
opt.confirm = true
opt.diffopt:append "linematch:60"
opt.lazyredraw = true
opt.linebreak = true
opt.modelines = 1
opt.relativenumber = true
opt.scrolloff = 8
opt.writebackup = false

-- highlight yank
api.nvim_create_autocmd("TextYankPost", {
  group = api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank()
  end,
})

-- toggle relative numbers {{{
local toggle_numbers_aug = api.nvim_create_augroup("ToggleRelativeNumber", { clear = true })

api.nvim_create_autocmd("InsertLeave", {
  group = toggle_numbers_aug,
  pattern = "*",
  callback = function()
    opt.relativenumber = true
  end,
})
api.nvim_create_autocmd("InsertEnter", {
  group = toggle_numbers_aug,
  pattern = "*",
  callback = function()
    opt.relativenumber = false
  end,
})
-- }}}

-- search highlight {{{
opt.hlsearch = false

local toogle_search_aug = api.nvim_create_augroup("ToogleIncSearchHighlight", { clear = true })
api.nvim_create_autocmd("CmdLineEnter", {
  group = toogle_search_aug,
  pattern = "*",
  callback = function()
    opt.hlsearch = true
  end,
})
api.nvim_create_autocmd("CmdLineLeave", {
  group = toogle_search_aug,
  pattern = "*",
  callback = function()
    opt.hlsearch = false
  end,
})
-- }}}

-- vim:foldmethod=marker:foldlevel=0
