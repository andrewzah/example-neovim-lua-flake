-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Neogen
require('neogen').setup({ snippet_engine = 'luasnip' })
nnoremap('<Leader>ng', require('neogen').generate,
  'Neogen: Generate annotation for the block under the cursor.')

