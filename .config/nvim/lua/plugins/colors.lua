return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        styles = {
          comments = {},
          keywords = {},
        },
      })
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },
}
