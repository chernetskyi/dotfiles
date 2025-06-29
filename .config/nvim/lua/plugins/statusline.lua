return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename', 'diff' },
        lualine_c = { 'branch' },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'filetype', 'encoding', 'fileformat' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            filetype_names = {
              TelescopePrompt = 'telescope',
              checkhealth = 'checkhealth',
              lazy = 'lazy',
              mason = 'mason',
              oil = 'oil',
            },
            symbols = {
              modified = ' ●',
              alternate_file = '',
              directory = '',
            },
          },
        },
        lualine_z = { 'tabs' },
      },
    },
  },
}
