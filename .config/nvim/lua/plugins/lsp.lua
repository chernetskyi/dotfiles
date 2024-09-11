return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      config = true,
    },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local mason_servers = {
      'bashls',
      'cssls',
      'docker_compose_language_service',
      'dockerls',
      'groovyls',
      'helm_ls',
      'html',
      'jsonls',
      'lua_ls',
      'marksman',
      'terraformls',
      'yamlls',
    }
    local global_servers = {
      'basedpyright',
      'ruff',
      'tflint',
    }

    local servers = vim.list_extend(mason_servers, global_servers)
    local lspconfig = require('lspconfig')
    local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

    for _, server in ipairs(servers) do
      lspconfig[server].setup({ capabilities = default_capabilities })
    end

    lspconfig['basedpyright'].setup({
      capabilities = default_capabilities,
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            ignore = { '*' },
          },
        },
      },
    })

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
    lspconfig['lua_ls'].setup({
      capabilities = default_capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
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
}
