return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  config = function()
    require('rose-pine').setup({
      enable = { legacy_highlights = false },
      styles = { italic = false },
    })
    vim.cmd.colorscheme('rose-pine')
  end,
}
