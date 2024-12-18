return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'comment',
          'css',
          'csv',
          'diff',
          'dockerfile',
          'editorconfig',
          'git_config',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'groovy',
          'hcl',
          'helm',
          'html',
          'ini',
          'jsdoc',
          'json',
          'make',
          'regex',
          'requirements',
          'sql',
          'terraform',
          'toml',
          'yaml',
        },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 4 * 1024 * 1024 -- 4 MiB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ab'] = '@block.outer',
              ['ib'] = '@block.inner',
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end,
  },
}
