local M = {}

local config = require('myplugin.grammar-check.config')
local checker = require('myplugin.grammar-check.checker')
local highlights = require('myplugin.grammar-check.highlights')

M.setup = function(opts)
  config.setup(opts)
  highlights.setup()
  checker.setup()
  
  vim.api.nvim_create_user_command('GrammarCheck', function()
    checker.check_buffer()
  end, { desc = 'Check grammar in current buffer' })
  
  vim.api.nvim_create_user_command('GrammarToggle', function()
    checker.toggle_auto_check()
  end, { desc = 'Toggle automatic grammar checking' })
  
  vim.api.nvim_create_user_command('GrammarClear', function()
    checker.clear_diagnostics()
  end, { desc = 'Clear grammar diagnostics' })
end

M.check_buffer = checker.check_buffer
M.toggle_auto_check = checker.toggle_auto_check
M.clear_diagnostics = checker.clear_diagnostics

return M