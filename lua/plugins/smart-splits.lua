-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap
local smart_splits = require('smart-splits')

smart_splits.setup {
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { '<Left>', '<Down>', '<Up>', '<Right>' },
  },
}

-- Move between splits
nnoremap('<C-Space><Left>', smart_splits.move_cursor_left,
  'Smart Splits: Navigate left between splits.')
nnoremap('<C-Space><Down>', smart_splits.move_cursor_down,
  'Smart Splits: Navigate down between splits.')
nnoremap('<C-Space><Up>', smart_splits.move_cursor_up,
  'Smart Splits: Navigate up between splits.')
nnoremap('<C-Space><Right>', smart_splits.move_cursor_right,
  'Smart Splits: Navigate right between splits.')

-- Resize splits
nnoremap('<S-Space><Left>', smart_splits.resize_left,
  'Smart Splits: Resize left the current split.')
nnoremap('<S-Space><Down>', smart_splits.resize_down,
  'Smart Splits: Resize down the current split.')
nnoremap('<S-Space><Up>', smart_splits.resize_up,
  'Smart Splits: Resize up the current split.')
nnoremap('<S-Space><Right>', smart_splits.resize_right,
  'Smart Splits: Resize right the current split.')

-- Move Buffers
nnoremap('<localleader><Left>', smart_splits.swap_buf_left,
  'Smart Splits: Resize left the current split.')
nnoremap('<localleader><Down>', smart_splits.swap_buf_down,
  'Smart Splits: Resize down the current split.')
nnoremap('<localleader><Up>', smart_splits.swap_buf_up,
  'Smart Splits: Resize up the current split.')
nnoremap('<localleader><Right>', smart_splits.swap_buf_right,
  'Smart Splits: Resize right the current split.')

-- Resize more
nnoremap('<localleader>s', smart_splits.start_resize_mode,
  'Smart Splits: Start resize mode.')

