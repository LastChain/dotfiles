local g = vim.g
local opt = vim.opt
local cmd = vim.api.nvim_command

g.tokyonight_transparent_sidebar    = true
g.tokyonight_transparent            = true
opt.background                      = "dark"
cmd[[colorscheme tokyonight]]

