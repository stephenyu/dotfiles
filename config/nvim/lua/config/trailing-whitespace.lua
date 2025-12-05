local trim_whitespace_group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })

-- Auto-remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = trim_whitespace_group,
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        
        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])
        
        -- Restore cursor position
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- Optional: Also remove trailing blank lines at end of file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = trim_whitespace_group,
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        
        -- Remove trailing blank lines
        vim.cmd([[%s/\n\+\%$//e]])
        
        -- Restore cursor position (with bounds checking)
        local line_count = vim.api.nvim_buf_line_count(0)
        if cursor_pos[1] > line_count then
            cursor_pos[1] = line_count
        end
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})
