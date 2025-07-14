-- ---------------
-- ---Telescope---
-- ---------------

-- Utils contains nvim-api keymap functions
local Utils = require('utils')

-- local noremap = Utils.noremap
-- local exprmap = Utils.exprmap
local nnoremap = Utils.nnoremap
-- local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
-- local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local imap = Utils.imap


local Telescope = require('telescope')
Telescope.setup {
  extensions = {
    bibtex = {
      -- Use context awareness
      context = true,
      -- Use non-contextual behavior if no context found
      -- This setting has no effect if context = false
      context_fallback = true,
    },
  },
}

Telescope.load_extension('bibtex')
Telescope.load_extension('zoxide')
Telescope.load_extension('project')
Telescope.load_extension('notify')

-- ---Mappings---
local builtin = require('telescope.builtin')
local extensions = Telescope.extensions

nnoremap('<leader>ff', builtin.find_files, 'Telescope: Find files.')
nnoremap('<leader>fg', builtin.live_grep, 'Telescope: Live grep.')
nnoremap('<leader>fb', builtin.buffers, 'Telescope: Switch buffers.')
nnoremap('<leader>fh', builtin.help_tags, 'Telescope: Show help tags.')

nnoremap('<leader>fcd', extensions.zoxide.list, 'Telescope: Show Zoxide.')
nnoremap('<leader>ft', '<CMD>Telescope bibtex<CR>', 'Telescope: Find Bibtex entries.')
nnoremap('<leader>fs', '<CMD>Telescope symbols<CR>', 'Telescope: Pick symbols.')
nnoremap('<leader>fp', extensions.project.project, 'Telescope: Show Projects.')
nnoremap('<leader>fn', extensions.notify.notify, 'Telescope: Show Notifications.')

