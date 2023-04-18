---@type ChadrcConfig

local M = {}

M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "one_light" },
  lsp_semantic_tokens = true,
  cmp = { style = "atom_colored" },
  tabufline = { lazyload = false },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
