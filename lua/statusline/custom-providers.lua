local colors = require('galaxyline.themes.colors').catppuccin
local Utils = require('utils')
local lspclient = require('galaxyline.providers.lsp')
local fileinfo = require('galaxyline.providers.fileinfo')
local vcs = require('galaxyline.providers.vcs')

local M = {}

function ViModeColor(mode)
  local mode_color = {
    n = colors.green,
    i = colors.blue,
    v = colors.magenta,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.red,
    no = colors.magenta,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.magenta,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.green,
    t = colors.green,
    Rv = colors.magenta,
    default = colors.fg_alt,
  }
  return mode_color[mode] == nil and mode_color['default'] or mode_color[mode]
end

function M.PaddingViMode()
  vim.api.nvim_command('hi GalaxyPaddingViMode guibg='..ViModeColor(vim.fn.mode()))
  return ' '
end

function M.ViMode()
  -- auto change color() according the vim mode
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c= 'COMMAND',
    V= 'VISUAL',
    [''] = 'VISUAL',
    v ='VISUAL',
    ['r?'] = ':CONFIRM',
    rm = '--MORE',
    R  = 'REPLACE',
    Rv = 'VIRTUAL',
    s  = 'SELECT',
    S  = 'SELECT',
    ['r']  = 'HIT-ENTER',
    [''] = 'SELECT',
    t  = 'TERMINAL',
    ['!']  = 'SHELL',
    default = 'UNKNOWN',
  }

  local vim_mode = vim.fn.mode()
  local string = alias[vim_mode] == nil and alias['default'] or alias[vim_mode]
  vim.api.nvim_command('hi GalaxyViMode gui=BOLD guibg='..ViModeColor(vim_mode)..' guifg='..colors.bg)
  return string..' '
end

function M.FileReadOnly(readonly_icon)
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon = readonly_icon or ''
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ''
end

--- Return a separator if the condition is true, a space otherwise
---@param condition boolean - the condition to check for
---@param separator string - the separator to return if condition is true
---@return string - the passed separator if condition = true, a space otherwise
function M.ConditionalSeparator(condition, separator)
  return condition and separator or ' '
end

function M.GetLspClient()
  local stringClients = lspclient.get_lsp_client()

  if stringClients == "No Active Lsp" then
    return stringClients
  end

  local clients = Utils.split(stringClients, ", ")

  local count = Utils.count(clients)

  if(count > 1) then
    return (clients[1] .. ' [+' .. count - 1 .. ' more]')
  end

  return stringClients
end

--- Get git branch and truncate with ellipsis if the string is too large
---@param len integer - the max length of the branch to show
---@return string - the branch name, truncated if its length is superior to len
function M.GetGitBranch(len)
  local branchName = vcs.get_git_branch()
  if string.len(branchName) > len then
    return string.sub(branchName, 1, len) .. '...'
  end
  return branchName
end

function M.GetFileInfoOrRecordOn()
  local recordMode = require('noice').api.statusline.mode

  if recordMode.has() then
    return recordMode.get()
  end

  return fileinfo.get_file_encode() .. ' ' .. fileinfo.get_file_format()
end

return M

