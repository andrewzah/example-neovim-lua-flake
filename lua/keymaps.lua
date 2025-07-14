-- --------------------
-- ---Custom Keymaps---
-- --------------------

-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local noremap = Utils.noremap
-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local imap = Utils.imap
-- local xmap = Utils.xmap

-- Leader
nnoremap('-', '<Nop>', 'Remove default operation on - to use it as leader.')
vim.g.mapleader = '-'
vim.g.maplocalleader = '--'

-- Tab
nnoremap('<C-left>', ':tabprevious<CR>', 'Move to previous tab.')
nnoremap('<C-right>', ':tabnext<CR>', 'Move to next tab.')

-- Show white-space characters
vim.o.list = false
vim.o.listchars = [[eol:¬,tab:>-,space:·,extends:>,precedes:<,nbsp:_,conceal:×]]
vim.cmd.highlight({'SpecialKey', 'term=standout', 'ctermfg=darkgrey', 'guifg=darkgrey'})
nnoremap('<F3>', '<cmd>set list! list?<CR>', 'Show invisible characters like tabs and white-spaces.')

-- Move Block of text
vnoremap('<A-DOWN>', ":m '>+1<CR>gv=gv", 'Move a block of text down.')
vnoremap('<A-UP>', ":m '<-2<CR>gv=gv", 'Move a block of text up.')
inoremap('<A-DOWN>', '<Esc>:m .+1<CR>==gi', 'Move a line down.');
inoremap('<A-UP>', '<Esc>:m .-2<CR>==gi', 'Move a line up.');

-- Text
inoremap('<C-u>', '<Esc>g~iw`^i', 'Change CASE of the current word.')

-- Diagnostics
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nnoremap('<leader>ef', vim.diagnostic.open_float, 'Show diagnostics in a floating window.')
nnoremap('[d', vim.diagnostic.goto_prev, 'Move to previous diagnostic.')
nnoremap(']d', vim.diagnostic.goto_next, 'Move to next diagnostic')
nnoremap('<leader>q', vim.diagnostic.setloclist, 'Show diagnostics in the location list.')

-- Misc
nnoremap('<Leader>l', '<Cmd>call setqflist([])<CR>', 'Clear quick-fixes list.')
noremap({'n', 'v'}, '<Leader>cc', '<Cmd>noh<CR>', 'Clear last search.', {
  buffer = true,
})
noremap({'n', 'v'}, '<Leader>y', '"+y', 'Copy to system clipboard.')

