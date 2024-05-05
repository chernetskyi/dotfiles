return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    }
  },
  cmd = 'Telescope',
  keys = {
    { '<leader><leader>', '<cmd>Telescope buffers<CR>',         desc = 'Find buffer' },
    { '<leader>ff',       '<cmd>Telescope find_files<CR>',      desc = 'Find file' },
    { '<leader>fg',       '<cmd>Telescope git_files<CR>',       desc = 'Find git file' },
    { '<leader>fhc',      '<cmd>Telescope command_history<CR>', desc = 'Find history of commands' },
    { '<leader>fhs',      '<cmd>Telescope search_history<CR>',  desc = 'Find history of searches' },
    { '<leader>fs',       '<cmd>Telescope live_grep<CR>',       desc = 'Find string' },
    { '<leader>fb',       '<cmd>Telescope builtin<CR>',         desc = 'Find Telescope builtin picker' },
    { '<leader>ss',       '<cmd>Telescope spell_suggest<CR>',   desc = 'Spell suggestions' },
  },
  config = function()
    require('telescope').setup({
      -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ripgrep-remove-indentation
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim',
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')
  end,
}
