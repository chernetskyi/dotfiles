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
  "pylsp",
  "lua_ls",
  "sqlls",
  "terraformls",
  "tflint",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
