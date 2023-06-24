local cmp = require "cmp"

return {
  completion = {
    completeopt = "menuone,noselect",
  },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  },
}
