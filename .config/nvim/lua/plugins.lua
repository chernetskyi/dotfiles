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

  use 'neovim/nvim-lspconfig'
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-vsnip', 'hrsh7th/cmp-cmdline'},
  -- config {{{
        config = function()
          vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

          local cmp = require 'cmp'
          cmp.setup({
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
              end
            },
            mapping = {
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.close(),
              ['<CR>'] = cmp.mapping.confirm(),
              ['<Tab>'] = cmp.mapping.select_next_item()
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' },
            }, {
              { name = 'buffer' },
            })
          })

          cmp.setup.cmdline('/', {
            sources = {{ name = 'buffer'}}
          })

          cmp.setup.cmdline(':', {
            sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
          })

          local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
          local servers = { 'bashls', 'dockerls', 'fsautocomplete', 'jsonls', 'terraformls', 'yamlls' }
          for _, lsp in ipairs(servers) do
            require('lspconfig')[lsp].setup {
              capabilities = capabilities
            }
          end
          require('lspconfig').elixirls.setup{
            capabilities = capabilities,
            cmd = { "/usr/lib/elixir-ls/language_server.sh"}
          }
        end}
  -- }}}

  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate',
  -- config {{{
        config = function()
          require('nvim-treesitter.configs').setup{highlight = {enable = true}}
        end}
  -- }}}

  use {'steelsojka/pears.nvim',
  --  config {{{
        config = function()
          require('pears').setup(function(conf)
            conf.remove_pair_on_outer_backspace(false)
            conf.expand_on_enter(true)
          end)
        end}
  -- }}}

  use {'andymass/vim-matchup',
  -- config {{{
        config = function()
          vim.g.loaded_matchit = 1
          require('nvim-treesitter.configs').setup{matchup = {enable = true}}
        end}
  -- }}}

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use 'dstein64/vim-startuptime'

  use 'lervag/vimtex'

  use {'aserowy/tmux.nvim',
  -- config {{{
    config = function()
      require("tmux").setup{
        navigation = {enable_default_keybindings = true},
        resize = {enable_default_keybindings = true}
      }
    end}
  -- }}}

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

  use {'chentau/marks.nvim',
  -- config {{{
        config = function()
          require('marks').setup {
              default_mappings = false,
              builtin_marks = {".", "\"", "0", "'"}
          }
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

  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'},
  -- config {{{
        config = function()
          require('lualine').setup {
            options = {theme = 'tokyonight'},
            sections = {lualine_x = {'filetype'}},
            tabline = {lualine_a = {'buffers'}, lualine_z = {'tabs'}},
            extensions = {'fugitive', 'nvim-tree'}
          }
        end}
  --  }}} 

  vim.g.tokyonight_style = 'night'
  use 'folke/tokyonight.nvim'
end)

-- vim:foldmethod=marker:foldlevel=0
