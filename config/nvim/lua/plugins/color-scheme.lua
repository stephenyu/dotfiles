return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa", 
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        overrides = function(colors)
          return {
            -- Visual = { bg = colors.theme.ui.bg_p2 }, -- Lighter background
            -- Or use a specific colour:
            Visual = { bg = "#2D4F67" }, -- Custom blue-ish
            -- Visual = { bg = "76946A" }, -- Custom blue-ish
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  }
}


