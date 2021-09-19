return require('packer').startup(function()
  use {'wbthomason/packer.nvim',
  -- config {{{
        config = function()
          vim.cmd[[
            augroup recompile-packer-on-save
              autocmd!
              autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            augroup end
          ]]
        end}
  -- }}}

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {'andymass/vim-matchup', event = 'VimEnter'}

  use 'neovim/nvim-lspconfig'
  use {'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer'},
  -- config {{{
        config = function()
          local cmp = require 'cmp'
          cmp.setup({
            mapping = {
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.close(),
              ['<CR>'] = cmp.mapping.confirm(),
              ['<Tab>'] = cmp.mapping.select_next_item()
            },
            sources = {
              { name = 'nvim_lsp' },
              { name = 'buffer' }
            }
          })

          vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
        end}
  -- }}}
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate',
  -- config {{{
        config = function()
          require('nvim-treesitter.configs').setup {
            highlight = {enable = true}
          }
        end}
  -- }}}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          vim.g.nvim_tree_ignore = {'.git'}
          vim.g.nvim_tree_auto_close = 1
          vim.g.nvim_tree_tab_open = 1
          vim.g.nvim_tree_add_trailing = 1
          vim.g.nvim_tree_hijack_cursor = 0

          vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
        end}
  -- }}}

  use {'ionide/Ionide-vim', requires = {'neovim/nvim-lspconfig', 'hrsh7th/nvim-cmp'}, run = 'make fsautocomplete',
  -- config {{{
        config = function()
          require('lspconfig')['fsautocomplete'].setup {
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }

            vim.cmd[[
              augroup fsharp-tooltip
                autocmd!
                autocmd CursorHold *.fs,*.fsi,*.fsx call fsharp#showTooltip()
              augroup END
            ]]

        end}
  -- }}}
  use 'hashivim/vim-terraform'
  use 'lervag/vimtex'

  use {'shaunsingh/nord.nvim',
  -- config {{{
        config = function()
          vim.g.nord_contrast = true
          vim.g.nord_borders = true
          vim.g.nord_italic = true
          require('nord').set()
        end}
  -- }}}
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'},
  -- config {{{
        config = function()
          require('lualine').setup {
            options = {theme = 'nord'},
            sections = {lualine_x = {'filetype'}},
            tabline = {lualine_a = {'filename'}},
            extensions = {'fugitive', 'nvim-tree'}
          }
        end}
  -- }}}
end)

-- vim:foldmethod=marker:foldlevel=0
