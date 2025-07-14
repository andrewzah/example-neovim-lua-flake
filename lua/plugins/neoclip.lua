-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Neoclip
require('telescope').load_extension('neoclip')
require('neoclip').setup {
  enable_persistent_history = true,
  continuous_sync = true,
}
nnoremap('<Leader>p', '<cmd>Telescope neoclip<CR>',
  'Neoclip: Show yanking history')

