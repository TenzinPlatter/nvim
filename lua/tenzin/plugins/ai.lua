return {
	"https://github.com/zbirenbaum/copilot-cmp",
	dependencies = {
		"https://github.com/zbirenbaum/copilot.lua",
		"olimorris/codecompanion.nvim",
	},
	config = function()
		require("copilot").setup({})
		require("copilot_cmp").setup({})
		require("codecompanion").setup({})

		local copilot_enabled = true
		vim.keymap.set("n", "<leader>ai", function()
			if copilot_enabled then
				vim.cmd("Copilot disable")
				copilot_enabled = false
				print("Copilot disabled")
			else
				vim.cmd("Copilot enable")
				copilot_enabled = true
				print("Copilot enabled")
			end
		end)
	end
}

-- return {}
