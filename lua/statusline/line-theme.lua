local M = {}

function M.setup()
  local catppuccin_colors = require('catppuccin.palettes').get_palette()
  local present, galaxyline_colors = pcall(require, 'galaxyline.themes.colors')
  if not present then
    return
  end
  galaxyline_colors.catppuccin = {
    bg = catppuccin_colors.crust,
    bg_alt = catppuccin_colors.mantle,
    fg = catppuccin_colors.text,
    fg_alt = catppuccin_colors.subtext0,
    yellow = catppuccin_colors.yellow,
    cyan = catppuccin_colors.sky,
    green = catppuccin_colors.green,
    orange = catppuccin_colors.peach,
    magenta = catppuccin_colors.mauve,
    blue = catppuccin_colors.blue,
    red = catppuccin_colors.red,
  }
end

return M
