-- [[ Configure Telescope ]]

local set = vim.keymap.set
local builtin = require('telescope.builtin')


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

-- TODO: add description
set('n', '<C-p>', builtin.git_files, {})
set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep >_ ") })
end)


-- See `:help telescope.builtin`
set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


