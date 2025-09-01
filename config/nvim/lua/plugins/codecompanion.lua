-- ~/.config/nvim/lua/plugins/init.lua
-- All plugins in a single file for LazyVim

return {
	-- CodeCompanion and its dependencies
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- Pinned to master as recommended
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					openai = function()
						return require("codecompanion.adapters").extend("openai", {
							env = {
								api_key = "cmd:op read 'op://luwrwzx45n2s6wfuqfzj4ffzma/OpenAI API Key/credential' --no-newline",
							},
							schema = {
								model = {
									default = "gpt-4.1",
								},
							},
						})
					end,
				},
				extensions = {
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							-- MCP Tools
							make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
							show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
							add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
							show_result_in_chat = true, -- Show tool results directly in chat buffer
							format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
							-- MCP Resources
							make_vars = true, -- Convert MCP resources to #variables for prompts
							-- MCP Prompts
							make_slash_commands = true, -- Add MCP prompts as /slash commands
						},
					},
				},
				strategies = {
					chat = {
						adapter = "openai",
					},
					inline = {
						adapter = "openai",
					},
					cmd = {
						adapter = "openai",
					},
				},
			})
		end,
	},

	-- Optional: mcphub extension for CodeCompanion
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "pnpm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
		config = function()
			require("mcphub").setup()
		end,
		-- This will be loaded as a dependency of codecompanion if you enable it
	},

	-- mini.diff for cleaner diffs with inline assistant
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		keys = {
			{
				"<leader>go",
				function()
					require("mini.diff").toggle_overlay(0)
				end,
				desc = "Toggle mini.diff overlay",
			},
		},
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Start with Git source disabled (as recommended for CodeCompanion)
				source = diff.gen_source.none(),
				-- Uncomment to use Git source by default:
				-- source = diff.gen_source.git(),
				view = {
					style = "sign",
					signs = {
						add = "▎",
						change = "▎",
						delete = "",
					},
				},
			})
		end,
	},

	-- img-clip.nvim for pasting images from clipboard
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
				markdown = {
					prompt_for_file_name = false,
					template = "![Image]($FILE_PATH)",
					use_absolute_path = false,
				},
			},
		},
		keys = {
			-- Suggested keymap for pasting images
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},

	-- Optional: render-markdown.nvim for better markdown rendering in chat buffer
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		opts = {},
	},

	-- Alternative to render-markdown.nvim (uncomment if you prefer this one)
	-- {
	--   "OXY2DEV/markview.nvim",
	--   lazy = false,
	--   opts = {
	--     preview = {
	--       filetypes = { "markdown", "codecompanion" },
	--       ignore_buftypes = {},
	--     },
	--   },
	-- },

	-- Ensure nvim-cmp completion works with CodeCompanion (if you're using it)
	{
		"hrsh7th/nvim-cmp",
		optional = true,
		opts = function(_, opts)
			-- Add codecompanion as a completion source
			opts.sources = opts.sources or {}
			table.insert(opts.sources, { name = "codecompanion" })
			return opts
		end,
	},

	-- Or if you're using blink.cmp (uncomment if needed)
	-- {
	--   "saghen/blink.cmp",
	--   optional = true,
	--   opts = {
	--     sources = {
	--       per_filetype = {
	--         codecompanion = { "codecompanion" },
	--       },
	--     },
	--   },
	-- },

	-- Ensure Tree-sitter parsers are installed
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"markdown",
				"markdown_inline",
			})
		end,
	},
}
