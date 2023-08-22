local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "helm_ls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "ruff_lsp",
  "sqlls",
  "terraformls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["lua_ls"].setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
