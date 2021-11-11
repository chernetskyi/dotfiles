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

  use {'neovim/nvim-lspconfig',
  -- config {{{
        config = function()
          require('lspconfig').bashls.setup{}
          require('lspconfig').dockerls.setup{}
          require('lspconfig').elixirls.setup{cmd = { "/usr/lib/elixir-ls/language_server.sh"};}
          require('lspconfig').jsonls.setup{}
          require('lspconfig').terraformls.setup{}
          require('lspconfig').yamlls.setup{}
        end}
  -- }}}

  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate',
  -- config {{{
        config = function()
          require('nvim-treesitter.configs').setup{highlight = {enable = true}}
        end}
  -- }}}

  use {'andymass/vim-matchup',
  -- config {{{
        config = function()
          vim.g.loaded_matchit = 1
          require('nvim-treesitter.configs').setup{matchup = {enable = true}}
        end}
  -- }}}

  use {'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path'},
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
              { name = 'buffer' },
              { name = 'path'}
            }
          })

          vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
        end}
  -- }}}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          vim.g.nvim_tree_add_trailing = 1
          require('nvim-tree').setup{auto_close = true}
          vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
        end}
  -- }}}

  use {'ionide/Ionide-vim', requires = {'neovim/nvim-lspconfig', 'hrsh7th/nvim-cmp'}, run = 'make fsautocomplete',
  -- config {{{
        config = function()
          require('lspconfig').fsautocomplete.setup {
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

  use 'lervag/vimtex'

  use {'tversteeg/registers.nvim',
  -- config {{{
        config = function()
          vim.g.registers_tab_symbol = "-->"
          vim.g.registers_space_symbol = "·"
          vim.g.registers_show_empty_registers = 0
          vim.g.registers_hide_only_whitespace = 1
          vim.g.registers_window_border = "single"
        end}
  -- }}}

  use {'steelsojka/pears.nvim',
  -- config {{{
        config = function()
          require('pears').setup(function(conf)
            conf.remove_pair_on_outer_backspace(false)
            conf.expand_on_enter(true)
          end)
        end}
  -- }}}

  use {'shaunsingh/nord.nvim',
  -- config {{{
        config = function()
          vim.g.nord_contrast = true
          vim.g.nord_borders = true
          vim.g.nord_italic = false
          require('nord').set()
        end}
  -- }}}

  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'},
  -- config {{{
        config = function()
          require('lualine').setup {
            options = {theme = 'nord'},
            sections = {lualine_x = {'filetype'}},
            tabline = {lualine_a = {'buffers'}, lualine_z = {'tabs'}},
            extensions = {'fugitive', 'nvim-tree'}
          }
        end}
  --  }}}

  use {'aserowy/tmux.nvim',
  -- config {{{
    config = function()
      require("tmux").setup{
        navigation = {enable_default_keybindings = true},
        resize = {enable_default_keybindings = true}
      }
    end}
  -- }}}

  use 'dstein64/vim-startuptime'

end)

-- vim:foldmethod=marker:foldlevel=0
