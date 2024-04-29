return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'ansiblels',
        'bashls',
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'gopls',
        'groovyls',
        'helm_ls',
        'html',
        'jsonls',
        'jsonnet_ls',
        'lua_ls',
        'marksman',
        'ruff_lsp',
        'sqls',
        'stylelint_lsp',
        'terraformls',
        'tflint',
        'yamlls',
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          })
        end,
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_init = function(client)
              local path = client.workspace_folders[1].name
              if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
              end
              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = { version = 'LuaJIT' },
                workspace = {
                  checkThirdParty = false,
                  library = { vim.env.VIMRUNTIME },
                },
              })
            end,
            settings = { Lua = {} },
          })
        end,
      },
    })
  end,
}
