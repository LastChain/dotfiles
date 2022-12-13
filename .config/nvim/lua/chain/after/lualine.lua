require('lualine').setup {
    options = {
        icons_enabled   = true,
        --theme           = 'gruvbox',
        theme           = 'tokyonight',
        --theme           = require('falcon-lualine').theme(),
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
