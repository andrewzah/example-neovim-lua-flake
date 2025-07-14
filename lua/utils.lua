-- Keymap functions
-- Adapted from:
-- https://github.com/miltonllera/neovim-config/blob/master/lua/utils.lua

local M = {}

function M.map(mode, lhs, rhs, desc, opts)
  opts = not opts and {} or opts
  local tbl = vim.tbl_extend("keep", opts, { silent =  true, desc = desc,
    remap = true, })
  vim.keymap.set(mode, lhs, rhs, tbl)
end

function M.noremap(mode, lhs, rhs, desc, opts)
  opts = not opts and {} or opts
  local tbl = vim.tbl_extend("keep", opts, { silent =  true, desc = desc, })
  vim.keymap.set(mode, lhs, rhs, tbl)
end

function M.exprnoremap(mode, lhs, rhs, desc, opts)
  opts = not opts and {} or opts
  local tbl = vim.tbl_extend("keep", opts, { silent =  true, expr = true,
    desc = desc, })
  vim.keymap.set(mode, lhs, rhs, tbl)
end

function M.exprmap(mode, lhs, rhs, desc, opts)
  opts = not opts and {} or opts
  local tbl = vim.tbl_extend("keep", opts, { silent =  true, expr = true,
    desc = desc, remap = true, })
  vim.keymap.set(mode, lhs, rhs, tbl)
end


-- Useful mode-specific shortcuts
-- nomenclature: "<expr?><mode><nore?>map(lhs, rhs)" where:
--      "expr?" optional expr option
--      "nore?" optional no-remap option
--      modes -> 'n' = NORMAL, 'i' = INSERT, 'x' = 'VISUAL', 'v' = VISUAL +
--      SELECT, 't' = TERMINAL

function M.nmap(lhs, rhs, desc, opts) M.map('n', lhs, rhs, desc, opts) end

function M.imap(lhs, rhs, desc, opts) M.map('i', lhs, rhs, desc, opts) end

function M.xmap(lhs, rhs, desc, opts) M.map('x', lhs, rhs, desc, opts) end

function M.nnoremap(lhs, rhs, desc, opts) M.noremap('n', lhs, rhs, desc, opts)
end

function M.vnoremap(lhs, rhs, desc, opts) M.noremap('v', lhs, rhs, desc, opts)
end

function M.xnoremap(lhs, rhs, desc, opts) M.noremap('x', lhs, rhs, desc, opts)
end

function M.inoremap(lhs, rhs, desc, opts) M.noremap('i', lhs, rhs, desc, opts)
end

function M.tnoremap(lhs, rhs, desc, opts) M.noremap('t', lhs, rhs, desc, opts)
end

function M.exprnnoremap(lhs, rhs, desc, opts) M.exprnoremap('n', lhs, rhs, desc,
  opts) end

function M.exprinoremap(lhs, rhs, desc, opts) M.exprnoremap('i', lhs, rhs, desc,
  opts) end

function M.count(table)
  local count = 0
  for _ in pairs(table) do count = count + 1 end
  return count
end

function M.split (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function M.command (name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts)
end

-- https://github.com/JoosepAlviste/dotfiles
function M.read_json_file(filename)
  local Path = require 'plenary.path'

  local path = Path:new(filename)
  if not path:exists() then
    return nil
  end

  local json_contents = path:read()
  local json = vim.fn.json_decode(json_contents)

  return json
end

function M.read_package_json()
  -- Get to the repo root
  local root = vim.fn.finddir('.git/..', vim.fn.expand('%:p:h') .. ';')
  return M.read_json_file(root .. "/package.json")
end

---Check if the given NPM package is installed in the current project.
---@param package string
---@return boolean
function M.is_npm_package_installed(package)
  local package_json = M.read_package_json()
  if not package_json then
    return false
  end

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end

  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end

return M

