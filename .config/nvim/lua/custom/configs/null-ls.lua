local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.autopep8,
  formatting.prettierd,
  formatting.reorder_python_imports,
  formatting.sqlfmt,
  formatting.stylua,
  formatting.terraform_fmt,
  formatting.trim_whitespace,

  lint.actionlint,
  lint.hadolint,
  lint.pylint,
  lint.shellcheck,
  lint.stylelint,
  lint.trail_space,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
