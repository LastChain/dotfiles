-- [[ Setting.options ]]
local opt = vim.opt

-- [[ Context ]]
opt.cmdheight 	    = 1       -- num:  Lines used for the command-line
opt.colorcolumn     = "72"    -- str:  Show col for max line length
opt.number          = true    -- bool: Show line numbers
opt.relativenumber  = true    -- bool: Show relative line numbers
opt.scrolloff       = 8       -- int:  Min num lines of context
opt.shortmess:append("c")     -- str:  Don't pass messages to |ins-completion-menu|
opt.signcolumn      = "yes"   -- str:  Show the sign column
opt.updatetime      = 50      -- num:  Updatetime to reduce delays
opt.wrap            = false   -- bool: Line breaks if words are exceeding textwidth 

-- [[ Filetypes ]]
opt.encoding        = 'utf8'  -- str:  String encoding to use
opt.fileencoding    = 'utf8'  -- str:  File encoding to use

-- [[ Theme ]]
opt.guicursor       = ""      -- str:  Configures the cursor-style for each mode
opt.syntax          = "ON"    -- str:  Allow syntax highlighting
opt.termguicolors   = true    -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.hlsearch        = false   -- bool: Highlight search matches
opt.ignorecase      = true    -- bool: Ignore case in search patterns
opt.incsearch       = true    -- bool: Use incremental search
opt.smartcase       = true    -- bool: Override ignorecase if search contains capitals

-- [[ Whitespace ]]
opt.expandtab       = true    -- bool: Use spaces instead of tabs
opt.shiftwidth      = 2       -- num:  Size of an indent
opt.smartindent	    = true    -- bool: Autoindenting when starting a new line
opt.softtabstop     = 2       -- num:  Number of spaces tabs count for in insert mode
opt.tabstop         = 2       -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitbelow      = true    -- bool: Place new window below the current one
opt.splitright      = true    -- bool: Place new window to right of current one

-- [[ Swap ]]
opt.backup 		      = false                                 -- bool: No backup for current file
opt.swapfile 	      = false                                 -- bool: Use swapfile for the buffer
opt.undodir 	      = os.getenv("HOME") .. "/.vim/undodir"  -- str: Directory for undo files
opt.undofile 	      = true                                  -- bool: Uses the directory from undodir


opt.breakindent = true
opt.completeopt = 'menuone,noselect'
--opt.isfname:append("@-@")
opt.mouse = 'a'

local g = vim.g
g.t_co = 256

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd(
  'TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  }
)


