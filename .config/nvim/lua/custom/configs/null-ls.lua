local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.ruff,
  formatting.sqlfmt,
  formatting.stylua,
  formatting.terraform_fmt,
  formatting.trim_whitespace,

  lint.actionlint,
  lint.gitlint,
  lint.hadolint,
  lint.ruff,
  lint.shellcheck,
  lint.stylelint,
  lint.todo_comments,
  lint.trail_space,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
