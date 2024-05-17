return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'BufRead',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufRead',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'comment',
          'css',
          'csv',
          'diff',
          'dockerfile',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gotmpl',
          'gowork',
          'gpg',
          'groovy',
          'hcl',
          'helm',
          'html',
          'html',
          'http',
          'ini',
          'jq',
          'jsdoc',
          'json',
          'json5',
          'jsonc',
          'jsonnet',
          'lua',
          'luadoc',
          'make',
          'markdown',
          'markdown_inline',
          'mermaid',
          'passwd',
          'python',
          'query',
          'regex',
          'requirements',
          'sql',
          'ssh_config',
          'terraform',
          'toml',
          'vim',
          'vimdoc',
          'yaml',
        },
        auto_installed = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 4 * 1024 * 1024 -- 4 MiB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
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
