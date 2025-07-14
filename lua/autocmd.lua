-- -------------------
-- ---Auto Commands---
-- -------------------

-- Palette
local augroups = {
  UserOnSave = vim.api.nvim_create_augroup('UserOnSave', {}),
  NumberToggle = vim.api.nvim_create_augroup('NumberToggle', {})
}

-- Add new line to the end of the file
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = augroups.UserOnSave,
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
      last_nonblank, n_lines, true, { '' })
    end
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = augroups.UserOnSave,
  pattern = '*',
  callback = function() require('mini.trailspace').trim() end,
})

vim.api.nvim_create_autocmd({"BufEnter","FocusGained","InsertLeave","WinEnter"}, {
  group = augroups.NumberToggle,
  pattern = '*',
  callback = function()
    if vim.o.number and vim.fn.mode() ~= "i" then
      vim.o.relativenumber = true
    end
  end
})

vim.api.nvim_create_autocmd({"BufLeave","FocusLost","InsertEnter","WinLeave"}, {
  group = augroups.NumberToggle,
  pattern = '*',
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end
})

