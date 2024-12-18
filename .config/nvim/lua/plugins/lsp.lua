return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        config = true,
      },
      'saghen/blink.cmp',
    },
    opts = {
      servers = {
        -- mason
        bashls = {},
        cssls = {},
        docker_compose_language_service = {},
        dockerls = {},
        groovyls = {},
        helm_ls = {},
        html = {},
        jsonls = {},
        lua_ls = {
          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  "${3rd}/luv/library",
                }
              }
            })
          end,
          settings = {
            Lua = {},
          },
        },
        marksman = {},
        terraformls = {},
        yamlls = {},
        -- global
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                ignore = { '*' },
              },
            },
          },
        },
        ruff = {},
        tflint = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
