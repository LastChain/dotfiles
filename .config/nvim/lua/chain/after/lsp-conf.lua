-- References:
-- [see Available LSP servers](https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers)
-- [example LSP configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
-- [json shema-store](https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips#jsonls)
-- [additional tools](https://github.com/williamboman/mason.nvim#how-to-use-installed-packages)

local set = vim.keymap.set
local lsp_buf = vim.lsp.buf

require("mason").setup{
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "jsonls",
    "marksman",
  }
})

---

local on_attach = function(_, _)
  set('n', '<leader>rn', lsp_buf.rename, {})
  set('n', '<leader>ca', lsp_buf.code_action, {})
  set('n', 'gd', lsp_buf.definition, {})
  set('n', 'gi', lsp_buf.implementation, {})
  set('n', 'gr', require('telescope.builtin').lsp_references, {})
  set('n', 'K', lsp_buf.hover, {})
end

---

require'lspconfig'.rust_analyzer.setup{
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { allFeatures = true, command = "clippy" },
      rustfmt = { extraArgs = { '+nightly' } }
    }
  }
}

---

require("lspconfig").marksman.setup{
  on_attach = on_attach,
  settings = {
    filetypes = { "markdown" }
  }
}

---

require("lspconfig").sumneko_lua.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = { enable = true, showWord = "Disable" },
      runtime = { version = "LuaJIT" },
      workspace = { library = { os.getenv("VIMRUNTIME") } },
      telemetry = { enable = false },
      diagnostics = { globals = { 'vim' } }
    }
  }
}

--- TODO JSONLS

require("lspconfig").jsonls.setup{
  on_attach = on_attach,
  settings = {
        json = {
          filetypes = { "json", "jsonc" },
          --schemas = require('schemastore').json.schemas(),
        },
    },
}

--- TODO: YAMLS

--- TODO ltex
--nvim_lsp.ltex.setup {
--  on_attach = on_attach,
--  settings = {
--    ltex = {
--         additionalRules = {
--           languageModel = '~/ngrams/',
--         },
--    },
--  },
--}

