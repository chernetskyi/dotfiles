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
    { '<leader><leader>', function() require('telescope.builtin').buffers() end,         desc = 'Find buffer' },
    { '<leader>ff',       function() require('telescope.builtin').find_files() end,      desc = 'Find file' },
    { '<leader>fg',       function() require('telescope.builtin').git_files() end,       desc = 'Find git file' },
    { '<leader>fhc',      function() require('telescope.builtin').command_history() end, desc = 'Find history of commands' },
    { '<leader>fhs',      function() require('telescope.builtin').search_history() end,  desc = 'Find history of searches' },
    { '<leader>fs',       function() require('telescope.builtin').live_grep() end,       desc = 'Find string' },
    { '<leader>fb',       function() require('telescope.builtin').builtin() end,         desc = 'Find Telescope builtin picker' },
    { '<leader>ss',       function() require('telescope.builtin').spell_suggest() end,   desc = 'Spell suggestions' },
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
