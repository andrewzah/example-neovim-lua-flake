-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

require('hypersonic').setup {}

-- Regexplainer
nnoremap(
  '<Leader>er',
  ':Hypersonic<CR>',
  'Hypersonic: explain regex under cursor'
)

