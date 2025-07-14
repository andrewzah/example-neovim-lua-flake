-- Overriding vim.notify with fancy notify if fancy notify exists
local notify = require("notify")
local Utils = require('utils')
local noremap = Utils.noremap
local macchiato = require("catppuccin.palettes").get_palette "macchiato"

vim.notify = notify

notify.setup {
  render = "compact",
  background_colour = macchiato.base,
}

noremap(
  '',
  '<Esc>',
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  "Clear notifications."
)

