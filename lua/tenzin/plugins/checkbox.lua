return {
	"https://github.com/opdavies/toggle-checkbox.nvim",
	opts = {},
	keys = {
		"<leader>tt",
		function()
			require("toggle-checkbox").toggle()
		end,
	},
}
