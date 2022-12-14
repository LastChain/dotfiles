local builtin = require "telescope.builtin"
local map = vim.keymap.set

--map('n', 'ff', [[:Telescope find_files]], {})
map('n', '<c-p>'             , builtin.find_files, {})
map('n', '<leader><leader>'  , builtin.oldfiles  , {})
map('n', '<leader>fg'        , builtin.live_grep , {})
map('n', '<leader>fh'        , builtin.help_tags , {})
