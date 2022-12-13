require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "markdown",
    "php",
    "python",
    "r",
    "rust",
    "scss",
    "sql",
    "toml",
    "vue",
    "yaml"
  },
  -- Install parsers synchronously (only applied 'ensure installed')
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
