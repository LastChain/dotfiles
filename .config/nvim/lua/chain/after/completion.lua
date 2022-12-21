local cmp = require("cmp")
local cmpc = require("cmp").config
local cmpm = require("cmp").mapping

require("luasnip.loaders.from_vscode").lazy_load()

-- setup & KB  
cmp.setup({
  mapping = cmpm.preset.insert({
    ['<C-b>'] = cmpm.scroll_docs(-4),
    ['<C-f>'] = cmpm.scroll_docs(4),
    ['<C-o>'] = cmpm.complete(),
    ['<C-e>'] = cmpm.abort(),
    ['<CR>']  = cmpm.confirm({ select = true}),
  }),

  -- LuaSnip
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- sources
  sources = cmpc.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
  },
    {{ name = 'buffer'    },  }
  ),

})
