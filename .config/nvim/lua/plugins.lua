return require('packer').startup(function()
  use {'wbthomason/packer.nvim',
  -- config {{{
        config = function()
          vim.api.nvim_create_autocmd('BufWritePost', {group = vim.api.nvim_create_augroup('PackerCompileOnSave', { clear = true }), pattern = 'plugins.lua', command = 'source <afile> | PackerCompile'})
        end}
  -- }}}

  use {'github/copilot.vim',
  -- config {{{
        config = function()
          vim.g.copilot_no_tab_map = true
          vim.keymap.set('i', '<C-Space>', 'copilot#Accept("")', { expr = true, script = true, silent = true })
        end}
  -- }}}

  use {'hrsh7th/nvim-cmp', requires = {'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'petertriho/cmp-git'},
  -- config {{{
        config = function()
          vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

          local kind_icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = 'ﴯ',
            Interface = '',
            Module = '',
            Property = 'ﰠ',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = ''
          }

          local cmp = require 'cmp'
          cmp.setup({
            mapping = {
              ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
              ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace})
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
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

          cmp.setup.filetype('gitcommit', { sources = cmp.config.sources({ { name = 'cmp_git' }, }, { { name = 'buffer' }, }) })

          cmp.setup.cmdline('/', { mapping = cmp.mapping.preset.cmdline(), sources = {{ name = 'buffer'}} })
          cmp.setup.cmdline(':', { mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }}) })

          local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
          for _, lsp in ipairs({'bashls', 'cssls', 'dockerls', 'html', 'jsonls', 'pylsp', 'sqlls', 'vimls', 'yamlls'}) do
            require('lspconfig')[lsp].setup{ capabilities = capabilities }
          end

          require('lspconfig').cssls.setup{cmd = {'vscode-css-languageserver', '--stdio'}}
          require('lspconfig').html.setup{cmd = {'vscode-html-languageserver', '--stdio'}}
          require('lspconfig').jsonls.setup{cmd = {'vscode-json-languageserver', '--stdio'}}
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
        end}
  -- }}}

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use {'tpope/vim-surround', requires = 'tpope/vim-repeat'}

  use 'dstein64/vim-startuptime'

  use {'aserowy/tmux.nvim',
  -- config {{{
    config = function()
      require('tmux').setup {
        navigation = { enable_default_keybindings = true },
        resize = { enable_default_keybindings = true }
      }
    end}
  -- }}}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          vim.g.nvim_tree_add_trailing = 1
          vim.g.nvim_tree_group_empty = 1
          require('nvim-tree').setup {
            open_on_tab = true,
            update_focused_file = { enable = true },
            diagnostics = { enable = true },
            view = {
              number = true,
              signcolumn = 'no'
            },
            renderer = { indent_markers = { enable = true } }
          }
          vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<cr>', { silent = true })
          vim.api.nvim_create_autocmd('BufEnter', {pattern = '*', command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", nested = true})
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

  use 'folke/tokyonight.nvim'
  -- config {{{
  vim.g.tokyonight_style = 'night'
  vim.g.tokyonight_terminal_colors = false
  vim.g.tokyonight_italic_keywords = false
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_lualine_bold = true
  vim.cmd[[colorscheme tokyonight]]
  -- }}}
end)

-- vim:foldmethod=marker:foldlevel=0
