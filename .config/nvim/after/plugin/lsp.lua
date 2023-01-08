-- [[ LSP settings ]]

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'eslint',
  'jsonls',
  'marksman',
  'r_language_server',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
})

lsp.configure(
  'r_language_server', {
    settings = {
      -- cmd = { "R", "--slave", "-e", "languageserver::run()" },
      -- filetypes = { "r", "rmd", "qmd" },
      -- log_level = { 2 },
    }
  }
)
-- Fix Undefined global 'vim'
lsp.configure(
  'sumneko_lua', {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        telemetry = { enable = false },
        completion = { enable = true, showWord = "Disable" },
        runtime = { version = "LuaJIT" },
        workspace = { checkThirdParty = false, library = { os.getenv("VIMRUNTIME") } },
      }
    }
  }
)
lsp.configure(
  'rust_analyzer', {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { allFeatures = true, command = "clippy" },
        rustfmt = { extraArgs = { '+nightly' } }
      }
    }
  }
)
lsp.configure(
  'marksman', {
    settings = {
      filetypes = { "markdown" }
    }
  }
)
lsp.configure(
  'jsonls', {
    settings = {
      json = {
        filetypes = { "json", "jsonc" },
        --schemas = require('schemastore').json.schemas(),
      },
    },
  }
)
lsp.configure(
  'YAMLS', {
    settings = {
      -- blank
    }
  }
)
lsp.configure(
  'ltex', {
    autostart = false,
    settings = {
      ltex = {
        enabled = { "latex", "tex", "bib", "markdown" },
        language = "de-DE",
        diagnosticSeverity = "information",
        setenceCacheSize = 2000,
        additionalRules = {
          enablePickyRules = true,
          motherTongue = "de-DE",
        },
        trace = { server = "verbose" },
        dictionary = {},
        disabledRules = {},
        hiddenFalsePositives = {},}
    }
  }
)


local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copvisualizes the undo historyilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})


lsp.on_attach(function(client, bufnr)

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
  end

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')


  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- TODO: Descr
  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap("<leader>vws", vim.lsp.buf.workspace_symbol, 'Buf Workspace Symbols')
  nmap("<leader>vrr", vim.lsp.buf.references, 'LSP buffer references')
  nmap("<leader>f", vim.lsp.buf.format, 'Buffer [F]ormat')

  -- Diagnostic keymaps
  nmap("[d", vim.diagnostic.goto_next, 'Diagnostic go to next')
  nmap("]d", vim.diagnostic.goto_prev, 'Diagnostic go to prev')
  nmap('<leader>e', vim.diagnostic.open_float, 'Open diagnostic float')
  nmap('<leader>q', vim.diagnostic.setloclist, 'Setloclist')

end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

