local nvim_lsp = require("lspconfig")

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

    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})

    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})

    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
end

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- Hide Diagnostics issues and put them on the side
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

-- When in Visual, show the Diagnostics Message
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

-- When in Insert, show the signature
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
