-- ----------------------------------
-- ---Native Configuration Options---
-- ----------------------------------

-- Gui
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.history = 100
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.ruler = true
vim.o.showmode = false
vim.o.signcolumn='auto:2'
if (vim.fn.exists('+colorcolumn')) then
  vim.o.colorcolumn = '' .. LAST_COLUMN
  vim.cmd.highlight({'ColorColumn', 'ctermbg=9'})
end
vim.o.textwidth = LAST_COLUMN
vim.o.cmdheight = 1
vim.o.conceallevel = 1
vim.o.laststatus = 3 -- Status line for focused window only

-- Indentation
vim.o.ai = true
vim.o.tabstop = TABSIZE
vim.o.softtabstop = TABSIZE
vim.o.shiftwidth = TABSIZE
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.smarttab = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Spell
vim.o.spell = true
vim.o.spelllang = 'en,fr'

-- Swap files
vim.o.directory = NVIM_TMP_DIRECTORY

