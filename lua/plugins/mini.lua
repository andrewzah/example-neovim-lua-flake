require('mini.trailspace').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.move').setup {
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-LEFT>',
    right = '<S-RIGHT>',
    down = '<S-DOWN>',
    up = '<S-UP>',

    -- Move current line in Normal mode
    line_left = '<M-LEFT>',
    line_right = '<M-RIGHT>',
    line_down = '<M-DOWN>',
    line_up = '<M-UP>',
  },
}

require('mini.indentscope').setup {
  symbol = '▏',
}
require('mini.splitjoin').setup {}
require('mini.ai').setup {}

