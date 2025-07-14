-- ----------------------
-- ---Global Variables---
-- ----------------------
NVIM_TMP_DIRECTORY = os.getenv('HOME') .. '/.config/nvim/tmp'
if (vim.fn.empty(vim.fn.glob(NVIM_TMP_DIRECTORY))) then
  vim.cmd([[silent !mkdir -p ]] .. NVIM_TMP_DIRECTORY)
end

NOTES_DIRECTORY = os.getenv('HOME') .. '/Notes'

HOME_DIRECTORY = os.getenv('HOME')

LAST_COLUMN = 80

TABSIZE = 2

