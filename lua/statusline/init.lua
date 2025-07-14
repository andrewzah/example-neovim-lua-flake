-- -----------------
-- ---Galaxy Line---
-- -----------------

require('statusline.line-theme').setup()
local gl = require('galaxyline')
local gls = gl.section
local colors = require('galaxyline.themes.colors').catppuccin
local conditions = require('galaxyline.condition')

-- Custom Providers
local customProviders = require('statusline.custom-providers')
local recordModOn = require('noice').api.statusline.mode.has;
local showFileEncodingOrRecord = function()
  return conditions.buffer_not_empty() or recordModOn()
end

-- Applying Sections
gls.left = {
  {
    PaddingViMode = {
      provider = customProviders.PaddingViMode,
    }
  },
  {
    ViMode = {
      provider = customProviders.ViMode,
      separator = ' ',
      separator_highlight = { colors.fg, colors.bg },
    }
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = conditions.buffer_not_empty,
      highlight = { colors.fg_alt, colors.bg, 'BOLD' },
    }
  },
  {
    FileNameNoRepoOrSmallWidth = {
      provider = 'FileName',
      condition = function()
        return conditions.buffer_not_empty()
          and (not conditions.check_git_workspace()
          or not conditions.hide_in_width()
        )
      end,
      highlight = { colors.blue, colors.bg }
    }
  },
  {
    FileNameGitRepo = {
      provider = 'FileName',
      condition = function()
        return conditions.buffer_not_empty()
          and conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      separator =  ' ',
      separator_highlight = { colors.bg, colors.bg_alt },
      highlight = { colors.blue, colors.bg }
    }
  },
  {
    GitBranch = {
      provider = function()
        return customProviders.GetGitBranch(12)
      end,
      icon = ' ',
      condition = function()
        return conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      separator = ' ',
      separator_highlight = { colors.fg_alt, colors.bg_alt },
      highlight = { colors.magenta, colors.bg_alt, 'BOLD' }
    }
  },
  {
    BranchSeparator = {
      provider = function()
        local vcs = require("galaxyline.providers.vcs")
        local boolean = vcs.diff_add()
        or vcs.diff_remove()
        or vcs.diff_modified()
        return customProviders.ConditionalSeparator(boolean, ' ')
      end,
      condition = function()
        return conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      highlight = { colors.fg, colors.bg_alt, }
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      icon = ' ',
      condition = function()
        return conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      highlight = { colors.green, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      icon = ' ',
      condition = function()
        return conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      highlight = { colors.red, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      icon = ' ',
      separator =  ' ',
      separator_highlight = { colors.bg_alt, colors.bg },
      condition = function()
        return conditions.check_git_workspace()
          and conditions.hide_in_width()
      end,
      highlight = { colors.blue, colors.bg_alt, 'BOLD' },
    }
  },
}

gls.mid = {
  {
    FirstSeparator = {
      provider = function() return ' ' end,
      highlight = { colors.bg, colors.bg_alt }
    }
  },
  {
    LspIconBold = {
      provider = function() return ' ' end,
      highlight = { colors.orange, colors.bg_alt, 'BOLD' },
    },
  },
  {
    LspClient = {
      provider = customProviders.GetLspClient,
      highlight = { colors.orange, colors.bg_alt },
    }
  },
  {
    DiagnosticSeparator = {
      provider = function()
        local diagnostic = require("galaxyline.providers.diagnostic")
        local boolean = diagnostic.get_diagnostic_error() ~= ""
        or diagnostic.get_diagnostic_warn() ~= ""
        or diagnostic.get_diagnostic_hint() ~= ""
        or diagnostic.get_diagnostic_info() ~= ""
        return customProviders.ConditionalSeparator(boolean, '   ')
      end,
      highlight = { colors.fg, colors.bg_alt, }
    }
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = ' ',
      highlight = { colors.red, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = ' ',
      highlight = { colors.orange, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = ' ',
      highlight = { colors.green, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = ' ',
      separator =  ' ',
      separator_highlight = { colors.bg_alt, colors.bg },
      highlight = { colors.fg_alt, colors.bg_alt, 'BOLD' },
    }
  },
  {
    LastSeparator = {
      provider = function() return ' ' end,
      highlight = { colors.bg_alt, colors.bg }
    }
  },

}

gls.right = {
  {
    FirstSeparator = {
      provider = function() return ' ' end,
      condition = showFileEncodingOrRecord,
      highlight = { colors.bg, colors.bg_alt }
    }
  },
  {
    FileEncodeFormatOrRecording = {
      provider = customProviders.GetFileInfoOrRecordOn,
      condition = showFileEncodingOrRecord,
      highlight = { colors.green, colors.bg_alt }
    }
  },
  {
    Whitespace = {
      provider = function() return ' ' end,
      condition = showFileEncodingOrRecord,
      separator =  '  ',
      separator_highlight = { colors.bg_alt, colors.bg },
      highlight = { colors.fg, colors.bg },
    }
  },
  {
    LineColumn = {
      provider = 'LineColumn',
      condition = conditions.buffer_not_empty,
      highlight = { colors.fg_alt, colors.bg }
    }
  },
  {
    LinePercent = {
      provider = 'LinePercent',
      condition = conditions.buffer_not_empty,
      separator =  '',
      separator_highlight = { colors.fg, colors.bg },
      highlight = { colors.fg_alt, colors.bg }
    }
  },
  {
    ScrollBar = {
      provider = 'ScrollBar',
      condition = conditions.buffer_not_empty,
      highlight = { colors.cyan, colors.bg_alt }
    }
  },
}

