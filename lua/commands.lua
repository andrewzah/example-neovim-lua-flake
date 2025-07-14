-- ---------------------
-- ---Custom Commands---
-- ---------------------
local Utils = require('utils')
local command = Utils.command

-- Swap folder
command('ListSwap', 'split | enew | r !ls -l ' .. NVIM_TMP_DIRECTORY, {})
command('CleanSwap', '!rm -rf ' .. NVIM_TMP_DIRECTORY .. '/*.swp', {})

-- Open help tags
command('HelpTags', 'Telescope help_tags', {})

-- Create ctags
command('MakeCTags',
  '!ctags -R --exclude=@.ctagsignore --exclude=@.gitignore .', {})

