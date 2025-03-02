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
    vim.o.hlsearch = true
  end,
})
vim.api.nvim_create_autocmd('CmdLineLeave', {
  group = toogle_search_aug,
  callback = function()
    vim.o.hlsearch = false
  end,
})

local toggle_numbers_aug = vim.api.nvim_create_augroup('ToggleRelativeNumber', { clear = true })
vim.api.nvim_create_autocmd('InsertLeave', {
  group = toggle_numbers_aug,
  callback = function()
    vim.o.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd('InsertEnter', {
  group = toggle_numbers_aug,
  callback = function()
    vim.o.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits on window resize',
  group = vim.api.nvim_create_augroup('AutoResize', { clear = true }),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspAttach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP: Rename' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Code action' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: Go to declaration' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end

    if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('LspDetach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = 'LspHighlight', buffer = event2.buf })
        end,
      })
    end

    if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, { desc = 'Toggle inlay hints' })
    end

    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end,
})
