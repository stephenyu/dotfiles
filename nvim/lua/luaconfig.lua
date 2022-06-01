local nvim_lsp = require("lspconfig")
-- local pyright = require("pyright")

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local on_attach = function(client, bufnr)
   local buf_map = vim.api.nvim_buf_set_keymap
   vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
   buf_map(bufnr, "n", "gh", ":LspHover<CR>", {silent = true})

    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})

    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})

    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})

    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    buf_map(bufnr, "n", "gi", ":LspRefs<CR>", {silent = true})

    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "i", "<C-s><C-s>", "<cmd> LspSignatureHelp<CR>", {silent = true})

    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})

    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})

    buf_map(bufnr, "n", "gd", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {silent = true})

    buf_map(bufnr, "n", "ca", ":lua vim.lsp.buf.code_action()<CR>", {silent = true})

    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})

    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float({\"line\"})")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})

    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})

    -- Format file in buffer on save
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

-- Setup nvim-cmp.
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's', }),
    ['<Up>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's', }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup .
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- OnAttach Loop
local servers = { 'tsserver', 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- https://quick-lint-js.com/install/neovim/homebrew/
require('lspconfig/quick_lint_js').setup {}

-- Hide Diagnostics issues and put them on the side
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

--
---- When in Visual, show the Diagnostics Message
---- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
--
---- When in Insert, show the signature
---- vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
