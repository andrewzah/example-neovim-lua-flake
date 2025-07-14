local Utils = require('utils')
local exprnnoremap = Utils.exprnnoremap;

exprnnoremap('gf', function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, 'Open file')

require('obsidian').setup {
  -- Required, the path to your vault directory.
  dir = "~/Obsidian",

  -- Optional, if you keep notes in a specific subdirectory of your vault.
  notes_subdir = "Notes",

  -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
  -- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
  log_level = vim.log.levels.INFO,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "Daily",
    -- Optional, if you want to change the date format for daily notes.
    date_format = "%d-%m-%Y"
  },

  -- Optional, completion.
  completion = {
    -- If using nvim-cmp, otherwise set to false
    nvim_cmp = true,
    -- Trigger completion at 2 chars
    min_chars = 2,
    -- Where to put new notes created from completion. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "notes_subdir",

    -- Whether to add the output of the node_id_func to new notes in autocompletion.
    -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
    prepend_note_id = true
  },

  -- Optional, for templates (see below).
  templates = {
    subdir = "Templates",
    date_format = "%d-%m-%Y",
    time_format = "%H:%M",
  },

  -- Optional, customize the backlinks interface.
  backlinks = {
    -- The default height of the backlinks pane.
    height = 10,
    -- Whether or not to wrap lines.
    wrap = true,
  },

  mappings = {
    ['gf'] = nil,
  },

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  -- Optional, customize how names/IDs for new notes are created.
  -- Create an id if the title is not given, in this case:
  -- Either `title` or `12/09/2023-13:32-afgy` (for example)
  note_id_func = function(title)
    local prefix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        prefix = prefix .. string.char(math.random(65, 90))
      end
    end
    return prefix .. "-" .. tostring(os.date("%d-%m-%Y-%H-%M"))
  end,

  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,

  -- Optional, by default commands like `:ObsidianSearch` will attempt to use
  -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
  -- first one they find. By setting this option to your preferred
  -- finder you can attempt it first. Note that if the specified finder
  -- is not installed, or if it the command does not support it, the
  -- remaining finders will be attempted in the original order.
  finder = "telescope.nvim",

  -- Optional, determines whether to open notes in a horizontal split, a vertical split,
  -- or replacing the current buffer (default)
  -- Accepted values are "current", "hsplit" and "vsplit"
  open_notes_in = "current"
}

