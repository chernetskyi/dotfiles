-- packer bootstrap {{{
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end
-- }}}

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim',
  -- config {{{
        config = function()
          vim.api.nvim_create_autocmd('BufWritePost', { group = vim.api.nvim_create_augroup('PackerCompileOnSave', { clear = true }), pattern = 'plugins.lua', command = 'source <afile> | PackerCompile' })
        end }
  -- }}}

  use { 'hrsh7th/nvim-cmp', requires = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'petertriho/cmp-git' },
  -- config {{{
        config = function()
          vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

          local cmp = require('cmp')
          cmp.setup{
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
              ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
          }

          cmp.setup.filetype('gitcommit', { sources = cmp.config.sources({{ name = 'cmp_git' }}, {{ name = 'buffer' }}) })

          cmp.setup.cmdline({ '/', '?' }, { mapping = cmp.mapping.preset.cmdline(), sources = {{ name = 'buffer' }} })
          cmp.setup.cmdline(':', { mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }}) })

          local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
          for _, lsp in ipairs({ 'ansiblels', 'bashls', 'cssls', 'dockerls', 'html', 'jsonls', 'pylsp', 'sumneko_lua', 'terraformls', 'yamlls' }) do
            require('lspconfig')[lsp].setup{ capabilities = capabilities }
          end

          -- Zsh support
          require('lspconfig')['bashls'].setup{
            cmd_env = { GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)' },
            filetypes = { 'sh', 'bash', 'zsh' }
          }
          -- Neovim support
          require('lspconfig')['sumneko_lua'].setup{
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                telemetry = { enable = false }
              }
            }
          }
        end }
  -- }}}

  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' },
  -- config {{{
        config = function()
          local null_ls = require('null-ls')
          null_ls.setup{
            sources = {
              null_ls.builtins.formatting.jq,
              null_ls.builtins.formatting.terraform_fmt,
            }
          }
        end}
  -- }}}

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
  -- config {{{
        config = function()
          require('nvim-treesitter.configs').setup{
            ensure_installed = { 'bash', 'comment', 'css', 'diff', 'dockerfile', 'git_rebase', 'gitignore', 'hcl', 'help', 'html', 'http', 'jsdoc', 'json', 'json5', 'jsonc', 'lua', 'make', 'markdown', 'markdown_inline', 'python', 'regex', 'scss', 'sql', 'yaml' },
            highlight = { enable = true }
          }
        end }
  -- }}}

  use { 'smjonas/live-command.nvim',
  -- config {{{
        config = function()
          require('live-command').setup{
            commands = {
              Norm = { cmd = 'norm' },
            }
          }
        end }
  -- }}}

  use { 'steelsojka/pears.nvim',
  --  config {{{
        config = function()
          require('pears').setup(function(conf)
            conf.remove_pair_on_outer_backspace(false)
            conf.expand_on_enter(true)
          end)
        end }
  -- }}}

  use { 'andymass/vim-matchup',
  -- config {{{
        config = function()
          vim.g.loaded_matchit = 1
        end }
  -- }}}

  use { 'kylechui/nvim-surround', tag = '*',
  -- config {{{
        config = function()
          require('nvim-surround').setup{}
        end }
  -- }}}

  use { 'numToStr/Comment.nvim',
  -- config {{{
        config = function()
          require('Comment').setup()
        end }
  -- }}}

  use { 'luukvbaal/nnn.nvim',
  -- config {{{
        config = function()
          local builtin = require('nnn').builtin
          require('nnn').setup{
            explorer = { session = 'shared' },
            auto_close = true,
            replace_netrw = 'explorer',
            mappings = {
              { '<C-t>', builtin.open_in_tab },
              { '<C-s>', builtin.open_in_split },
              { '<C-v>', builtin.open_in_vsplit }
            }
          }
          vim.keymap.set('n', '<c-n>', ':NnnExplorer<cr>', { silent = true })
        end }
    -- }}}

  use { 'rose-pine/neovim', as = 'rose-pine',
  -- config {{{
        config = function()
          require('rose-pine').setup{
            disable_background = true,
            disable_float_background = true,
            disable_italics = true,

            highlight_groups = {
              Folded = { fg = 'subtle' },
              gitcommitSummary = { fg = 'text' },
              TSPunctDelimeter = { fg = 'text' },
            }
          }
        vim.cmd('colorscheme rose-pine')
        end }
  -- }}}

  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons',
  -- config {{{
        config = function()
          require('lualine').setup{
            options = { ignore_focus = { 'nnn' } },
            sections = { lualine_x = { 'filetype' } },
            tabline = {
              lualine_a = { 'buffers' },
              lualine_z = { 'tabs' }
            }
          }
        end }
  --  }}}

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

-- vim:foldmethod=marker:foldlevel=0
