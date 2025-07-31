return {
	{
		"https://github.com/zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = {
					enabled = false,
				},
				filetypes = {
					["*"] = true,
					markdown = false,
					help = false,
					text = false,
				},
			})

			vim.cmd("silent! Copilot disable")
		end,
		keys = {
			{"<leader>ai", function() vim.cmd("Copilot toggle") end, desc = "Toggle copilot"}
		}
	},
	{
		"https://github.com/zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({
				formatting = {
					format = require("copilot_cmp.format").format,
				},
				experimental = {
					ghost_text = true,
				},
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {
			chat = {
				enabled = true,
				keymaps = {
					toggle = "<leader>co",
					send = "<C-Enter>",
				},
			},
			commands = {
				enabled = true,
			},
		},
	},
	keys = {
		{
			"<leader>co",
			function()
				vim.cmd("CodeCompanion")
			end,
			desc = "Code Companion",
		},
		{
			"<leader>coc",
			function()
				vim.cmd("CodeCompanionChat")
			end,
			desc = "Code Companion Chat",
		},
	},
}
