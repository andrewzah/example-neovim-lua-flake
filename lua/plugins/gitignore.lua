local gitignore = require("gitignore")
local nnoremap = require('utils').nnoremap

nnoremap("<leader>gi", gitignore.generate, "Gitignore: Generate gitignore")

