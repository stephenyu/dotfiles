local map = vim.keymap.set

-- Disable F1 help in visual mode only
map('v', '<F1>', '<nop>', { desc = 'Disabled' })

-- Toggle file picker with F1 in both normal and insert modes
map({'n', 'i'}, '<F1>', function()
  -- Check if a picker is currently active
  local picker = Snacks.picker.get({ tab = true })
  if picker and #picker > 0 then
    -- Close active picker
    picker[1]:close()
  else
    -- Open smart picker
    Snacks.picker.smart()
  end
end, { desc = 'Toggle smart picker' })
