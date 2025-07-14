local null_ls = require('null-ls')

-- Test for commit.
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.commitlint.with({
      args = { '--format', 'commitlint-format-json', '--config', HOME_DIRECTORY .. '/.commitlintrc.js' }
    }),
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.markdownlint,
  }
}

