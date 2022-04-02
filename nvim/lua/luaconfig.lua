local nvim_lsp = require("lspconfig")
-- local rust_tools = require("rust-tools")

-- rust_tools.setup({})
-- rust_tools.setup {
--     on_attach = function(client)
--         on_attach(client)
--     end
-- }

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

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

    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})

    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})

    -- Format file in buffer on save
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

nvim_lsp.tsserver.setup {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "absolute"
      }
    },
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

nvim_lsp.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    on_attach(client)
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}

-- require('rust-tools').setup({
--   server = { on_attach = on_attach }
-- })

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
-- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

-- When in Insert, show the signature
-- vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
