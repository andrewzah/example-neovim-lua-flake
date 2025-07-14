-- Todo-Comments
local todoCommentsConfig = {
  -- keywords recognized as todo comments
  keywords = {
    BOOTSTRAP = { icon = '', color = '#b1acae', },
    BUG       = { icon = '', color = '#aa003e', },
    DEBUG     = { icon = '', color = '#80af71', alt = { 'DEBUGGING' } },
    DEPR      = { icon = '', color = '#a64ca6', alt = { 'DEPRECATED' } },
    FIX       = { icon = '', color = '#ffd700', alt = { 'FIXME', 'FIXIT' } },
    HACK      = { icon = '', color = '#ff8c00', },
    IMPT      = { icon = '', color = '#f08080', alt = { 'IMPORTANT' } },
    NOTE      = { icon = '', color = '#e04a9a', alt = { 'INFO' } },
    PERF      = { icon = '', color = '#997a8e', alt = { 'OPTIM',
      'PERFORMANCE', 'OPTIMIZE' } },
    QUERY     = { icon = '', color = '#6495ed', alt = { 'QRY' } },
    TEMP      = { icon = '', color = '#b0c4de', alt = { 'TEMPORARY',
      'TMP' } },
    TEST      = { icon = '', color = '#a580ec', alt = { 'TESTING' } },
    PASSED    = { icon = '', color = '#5ac88b', },
    FAILED    = { icon = '', color = '#dd0051', },
    TODO      = { icon = '', color = '#3cb371', },
  },
  gui_style = {
    fg = 'NONE',
    bg = 'BOLD',
  },
  highlight = {
    comments_only = true, -- uses treesitter to match keywords in comments only
  },
}

require('todo-comments').setup(todoCommentsConfig)
-- HACK: Set todo signs to be bold
for kw, opts in pairs(todoCommentsConfig.keywords) do
  vim.cmd('hi TodoSign' .. kw .. ' guifg=' .. opts.color .. ' gui=bold')
end

