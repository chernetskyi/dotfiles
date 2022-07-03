return require('packer').startup(function(use)
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

  use {'hrsh7th/nvim-cmp', requires = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'petertriho/cmp-git' },
  -- config {{{
        config = function()
          vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

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
          cmp.setup{
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
              ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace})
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            }),
            formatting = {
              format = function(_, vim_item)
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                return vim_item
              end
            }
          }

          cmp.setup.filetype('gitcommit', { sources = cmp.config.sources({{ name = 'cmp_git' }}, {{ name = 'buffer' }}) })

          cmp.setup.cmdline('/', { mapping = cmp.mapping.preset.cmdline(), sources = {{ name = 'buffer' }} })
          cmp.setup.cmdline(':', { mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }}) })

          local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
          for _, lsp in ipairs({ 'ansiblels', 'bashls', 'cssls', 'dockerls', 'html', 'jsonls', 'pylsp', 'sumneko_lua', 'terraformls', 'yamlls' }) do
            require('lspconfig')[lsp].setup{ capabilities = capabilities }
          end

          -- Zsh support
          require('lspconfig').bashls.setup{
            cmd_env = { GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)' },
            filetypes = { 'sh', 'bash', 'zsh' }
          }
          -- Neovim support
          require('lspconfig').sumneko_lua.setup{
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                telemetry = { enable = false }
              }
            }
          }
        end}
  -- }}}

  use {'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' },
  -- config {{{
        config = function()
          local null_ls = require('null-ls')

          local sources = {
              null_ls.builtins.diagnostics.shellcheck.with{ filetypes = { 'sh', 'zsh', 'bash' } },
              null_ls.builtins.diagnostics.vale.with{ filetypes = { 'text', 'markdown', 'html', 'tex' } },
              null_ls.builtins.diagnostics.zsh,
              null_ls.builtins.formatting.jq,
              null_ls.builtins.formatting.terraform_fmt,
          }

          null_ls.setup{ sources = sources }

        end}
  -- }}}

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
  -- config {{{
        config = function()
          require'nvim-treesitter.configs'.setup{
            ensure_installed = { 'bash', 'comment', 'css', 'dockerfile', 'hcl', 'help', 'html', 'http', 'jsdoc', 'json', 'json5', 'jsonc', 'lua', 'python', 'regex', 'scss', 'yaml' },
            highlight = { enable = true }
          }
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
      require('tmux').setup{
        navigation = { enable_default_keybindings = true },
        resize = { enable_default_keybindings = true }
      }
    end}
  -- }}}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          require('nvim-tree').setup{
            open_on_tab = true,
            update_focused_file = { enable = true },
            diagnostics = { enable = true },
            view = {
              number = true,
              signcolumn = 'no'
            },
            renderer = {
              add_trailing = true,
              group_empty = true,
              indent_markers = { enable = true }
            }
          }
          vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<cr>', { silent = true })
          vim.api.nvim_create_autocmd('BufEnter', {pattern = '*', command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", nested = true})
        end}
  -- }}}

  use {'rose-pine/neovim', as = 'rose-pine',
  -- config {{{
        config = function()
          require('rose-pine').setup{
            disable_background = true,
            disable_float_background = true,
            disable_italics = true,

            highlight_groups = {
              Folded = { fg = 'subtle' },
              gitcommitSummary = { fg = 'text' },
            }
          }
        vim.cmd[[colorscheme rose-pine]]
        end}
  -- }}}

  use {'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          require('lualine').setup{
            options = { globalstatus = false },
            sections = { lualine_x = { 'filetype' } },
            tabline = {
              lualine_a = { 'buffers' },
              lualine_z = { 'tabs' }
            },
            extensions = { 'fugitive', 'nvim-tree' }
          }
        end}
  --  }}}

end)

-- vim:foldmethod=marker:foldlevel=0
