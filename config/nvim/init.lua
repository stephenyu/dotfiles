vim.g.mapleader = " "

require('config.keymaps')
require("config.lazy")
require("config.trailing-whitespace")

-- Custom statusline
-- Function to get current mode
local function mode()
  local modes = {
    ['n'] = 'NORMAL',
    ['no'] = 'N-PENDING',
    ['v'] = 'VISUAL',
    ['V'] = 'V-LINE',
    [''] = 'V-BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'S-LINE',
    [''] = 'S-BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'V-REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM-EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL'
  }
  return modes[vim.fn.mode()] or 'UNKNOWN'
end

-- Make it available globally
_G.mode = mode

-- Updated statusline with mode
vim.opt.statusline = "%{v:lua.mode()} | %f %m %= %l:%c %p%%"
vim.opt.laststatus = 2  -- Always show statusline
vim.opt.cmdheight = 0   -- Hide command line

-- Make the write message disappear quicker
vim.opt.updatetime = 250  -- Faster refresh (default is 4000ms)
vim.opt.timeoutlen = 500  -- Faster timeout for key combinations

-- vim.opt.number = true         -- Line numbers
-- vim.opt.relativenumber = true -- Relative line numbers
vim.opt.expandtab = true      -- Use spaces instead of tabs
-- vim.opt.tabstop = 2           -- Tab width
-- vim.opt.shiftwidth = 2        -- Indent width
vim.opt.smartindent = true    -- Smart indenting

vim.opt.signcolumn="no"  -- Always show, fixed width of 1 character
vim.opt.numberwidth = 1  -- Default is 4, can be 1-20

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
