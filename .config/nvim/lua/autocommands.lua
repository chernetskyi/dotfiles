vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local toogle_search_aug = vim.api.nvim_create_augroup('ToogleIncSearchHighlight', { clear = true })
vim.api.nvim_create_autocmd('CmdLineEnter', {
  group = toogle_search_aug,
  callback = function()
    vim.opt.hlsearch = true
  end,
})
vim.api.nvim_create_autocmd('CmdLineLeave', {
  group = toogle_search_aug,
  callback = function()
    vim.opt.hlsearch = false
  end,
})

local toggle_numbers_aug = vim.api.nvim_create_augroup('ToggleRelativeNumber', { clear = true })
vim.api.nvim_create_autocmd('InsertLeave', {
  group = toggle_numbers_aug,
  callback = function()
    vim.opt.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd('InsertEnter', {
  group = toggle_numbers_aug,
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspAttach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('LspHighlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = vim.api.nvim_create_augroup('LspDetach', { clear = true }),
  callback = function(event)
    vim.lsp.buf.clear_references()
    vim.api.nvim_clear_autocmds({ group = 'LspHighlight', buffer = event.buf })
  end,
})
