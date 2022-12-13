local map = vim.keymap.set
local g = vim.g

g.loaded_netrw          = 1
g.loaded_netrwPlugin    = 1

require("nvim-tree").setup()

map('n', '<c-n>', [[:NvimTreeFindFileToggle <CR>]], {silent = true, noremap = true})
