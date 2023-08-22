local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.cmp",
  },

  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      require("core.utils").load_mappings "nvimtree"
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
          end
        end,
      })
    end,
    opts = require "custom.configs.nvimtree",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
}

return plugins
