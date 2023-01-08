require'quarto'.setup{
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    languages = { 'r', 'python', 'julia' },
    diagnostics = {
      enabled = true,
      triggers = { "BufWrite" }
    },
    completion = {
      enabled = false,
    },
  },
  keymap = {
    hover = 'K',
    definition = 'gd'
  },
  sources = {
    { name = 'otter' },
  }
}
-- local quarto = require "quarto"
-- local map = vim.keymap.set

-- map('n','<leader>qp', quarto.quartoPreview, {silent = true, noremap = true})

