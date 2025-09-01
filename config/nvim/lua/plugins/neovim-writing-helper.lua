return {
	{
		dir = "~/Work/neovim-writing-helper", -- Path to your local plugin
		name = "neovim-writing-helper",
		ft = "markdown", -- Only load for markdown files
		config = function()
			require("neovim-writing-help").setup({
				enabled = true,
				auto_start = true,
				highlight_color = "DiffAdd", -- Default highlight group
				suggestion_timeout = 3000, -- Highlight duration in ms
				min_word_length = 3, -- Minimum word length to analyze
			})
		end,
	},
}
