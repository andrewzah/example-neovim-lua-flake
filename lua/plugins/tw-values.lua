local Utils = require('utils')
local nnoremap = Utils.nnoremap

-- tw-values.nvim
require('tw-values').setup {
  border = 'rounded', -- Valid window border style,
  show_unknown_classes = true, -- Shows the unknown classes popup
  focus_preview = false, -- Sets the preview as the current window
  copy_register = '', -- The register to copy values to,
  keymaps = {
    copy = '<C-y>'  -- Normal mode keymap to copy the CSS values between {}
  },
}

nnoremap('<LEADER>lv', '<CMD>TWValues<CR>', 'TWValues: Show TailwindCSS values')

