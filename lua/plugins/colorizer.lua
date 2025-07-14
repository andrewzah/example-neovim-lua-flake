-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Colorizer
local colorizer_options_css = {
  css = true,
  css_fn = true,
  tailwind = true,
  sass = { enable = true, parsers = { 'css' }, },
  mode = 'foreground'
}

require('colorizer').setup {
  filetypes = {
    '*',
    css = colorizer_options_css,
    sass = colorizer_options_css,
    less = colorizer_options_css,
    html = colorizer_options_css,
    vue = colorizer_options_css,
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    names = false,
    css = false,
    css_fn = false,
    tailwind = false,
    sass = { enable = false, },
    mode = 'foreground',
  },
}

nnoremap('<Leader>nc', ':ColorizerToggle<CR>', 'Colorizer: Toggle on/off.')

