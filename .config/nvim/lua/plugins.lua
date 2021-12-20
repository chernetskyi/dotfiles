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

  use {'hrsh7th/nvim-cmp', requires = {'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-cmdline'},
  -- config {{{
        config = function()
          vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

          local kind_icons = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
          }

          local cmp = require 'cmp'
          cmp.setup({
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
              end
            },
            mapping = {
              ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
              ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace})
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' },
            }, {
              { name = 'buffer' },
            }),
            formatting = {
              format = function(entry, vim_item)
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                return vim_item
              end
            }
          })

          cmp.setup.cmdline('/', {
            sources = {{ name = 'buffer'}}
          })

          cmp.setup.cmdline(':', {
            sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
          })

          local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
          local servers = { 'bashls', 'cssls', 'dockerls', 'elixirls', 'html', 'jsonls', 'yamlls' }
          for _, lsp in ipairs(servers) do
            require('lspconfig')[lsp].setup {
              capabilities = capabilities
            }
          end
          require('lspconfig').elixirls.setup{cmd = { "/usr/lib/elixir-ls/language_server.sh"}}
          require('lspconfig').cssls.setup{cmd = {"vscode-css-languageserver", "--stdio"}}
          require('lspconfig').html.setup{cmd = {"vscode-html-languageserver", "--stdio"}}
          require('lspconfig').jsonls.setup{cmd = {"vscode-json-languageserver", "--stdio"}}
        end}
  -- }}}

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
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

  use {'andymass/vim-matchup', event = 'VimEnter',
  -- config {{{
        config = function()
          vim.g.loaded_matchit = 1
          require('nvim-treesitter.configs').setup{matchup = {enable = true}}
        end}
  -- }}}

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use {'tpope/vim-surround', requires = 'tpope/vim-repeat'}

  use 'dstein64/vim-startuptime'

  use {'ionide/Ionide-vim', run = 'make fsautocomplete'}

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
            builtin_marks = {".", "\"", "0", "'"},
            excluded_filetypes = {"NvimTree"}
          }
        end}
  -- }}}

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim'},
  -- config {{{
        config = function()
          require('telescope').setup {
            extensions = {
              fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
              }
            }
          }
          require('telescope').load_extension('fzf')
        end}
  -- }}}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          vim.g.nvim_tree_add_trailing = 1
          require('nvim-tree').setup {
            auto_close = true,
            open_on_tab = true,
            update_focused_file = { enable = true },
            diagnostics = { enable = true },
            view = {
              auto_resize = true,
              number = true
            }
          }
          vim.api.nvim_set_keymap('n', '<c-n>', ':NvimTreeFindFileToggle<cr>', {noremap = true})
        end}
  -- }}}

  use {'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons',
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
  vim.cmd[[colorscheme tokyonight]]
end)

-- vim:foldmethod=marker:foldlevel=0
