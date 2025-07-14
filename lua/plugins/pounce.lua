-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local noremap = Utils.noremap
local nnoremap = Utils.nnoremap

-- Pounce
nnoremap('<leader>s', function() require('pounce').pounce {} end, 'Pounce: Search.')
nnoremap('<leader>s', function() require('pounce').pounce { do_repeat = true } end,
  'Pounce: Search with repeat.')
noremap('x', '<leader>s', function() require('pounce').pounce {} end,
  'Pounce: Search.')
noremap('o', '<leader>gs', function() require('pounce').pounce {} end,
  'Pounce: Search.')
nnoremap('<leader>S', function() require('pounce').pounce { input = { reg = '/' } } end
  , 'Pounce: Search with regex.')

