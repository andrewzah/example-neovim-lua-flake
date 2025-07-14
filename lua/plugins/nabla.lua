-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Nabla
nnoremap('<Leader>el', function() require('nabla').popup() end,
  'Nabla: show popup')

