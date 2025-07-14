local Utils = require('utils')

local nnoremap = Utils.nnoremap

-------------
---Trouble---
-------------

require('trouble').setup {
  use_diagnostic_signs = false,
  mode = 'workspace_diagnostics',
  fold_open = '', -- icon used for open folds
  fold_closed = '', -- icon used for closed folds
  signs = {
      -- icons / text used for a diagnostic
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '',
    },
  auto_preview = false,
}

nnoremap('<leader>xx', '<cmd>TroubleToggle<cr>', 'Trouble: toggle.')
nnoremap('<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>',
  'Trouble: toggle workspace diagnostics' )
nnoremap('<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',
  'Trouble: toggle document diagnostics')
nnoremap('<leader>xq', '<cmd>TroubleToggle quickfix<cr>',
  'Trouble: quickfix.' )
nnoremap('<leader>xl', '<cmd>TroubleToggle loclist<cr>',
  'Trouble: toggle loclist')
nnoremap('gR', '<cmd>TroubleToggle lsp_references<cr>',
  'Trouble: get references of symbol under cursor.' )

