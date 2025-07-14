-- Hardtime
require('hardtime').setup {
  disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "alpha", "help" },
  allow_different_key = true,
  enabled = true;
  restricted_keys = {
    ['<Up>'] = { 'n', 'x', 'i', 'v' },
    ['<Down>'] = { 'n', 'x', 'i', 'v' },
    ['<Left>'] = { 'n', 'x', 'i', 'v' },
    ['<Right>'] = {'n', 'x', 'i', 'v' },
    ['+'] = {},
    ['-'] = {},
    ['g<Up>'] = { 'n', 'x' },
    ['g<Down>'] = { 'n', 'x' },
  },
  disabled_keys = {
    ['<Up>'] = {},
    ['<Down>'] = {},
    ['<Left>'] = {},
    ['<Right>'] = {},
  },
}

