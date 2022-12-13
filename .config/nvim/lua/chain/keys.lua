--[[ keys.lua ]]
--local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

-- Clear search higlight
map('n', '<leader>h', [[:nohlsearch <CR>]], {silent = true, noremap = true})

-- Toggle nvim-tree-explorer
map('n', '<c-n>', [[:NvimTreeFindFileToggle <CR>]], {silent = true, noremap = true})

-- toggle colorcolumn
map('n', '<c-l>', function()
  local value = vim.api.nvim_get_option_value("colorcolumn", {})
  if value == "" then
    vim.api.nvim_set_option_value("colorcolumn", "72", {})
  else
    vim.api.nvim_set_option_value("colorcolumn", "", {})
  end
end, {silent = true, noremap = true})
