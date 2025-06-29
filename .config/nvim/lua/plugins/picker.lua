return {
  {
    'ibhagwan/fzf-lua',
    cmd = { 'FzfLua' },
    keys = {
      {
        '<leader><leader>',
        function()
          require('fzf-lua').buffers()
        end,
        desc = 'Find buffer',
      },
      {
        '<leader>fb',
        function()
          require('fzf-lua').builtin()
        end,
        desc = 'Find fzf-lua builtin picker',
      },
      {
        '<leader>ff',
        function()
          require('fzf-lua').files()
        end,
        desc = 'Find file',
      },
      {
        '<leader>fg',
        function()
          require('fzf-lua').git_files()
        end,
        desc = 'Find git file',
      },
      {
        '<leader>fk',
        function()
          require('fzf-lua').keymaps()
        end,
        desc = 'Find keymap',
      },
      {
        '<leader>fs',
        function()
          require('fzf-lua').live_grep_native()
        end,
        desc = 'Find string',
      },
      {
        '<leader>ss',
        function()
          require('fzf-lua').spell_suggest()
        end,
        desc = 'Spell suggestions',
      },
    },
    opts = {
      winopts = {
        border = 'none',
        preview = {
          border = 'none',
        },
      },
    },
  },
}
