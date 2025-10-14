return {
	"folke/which-key.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 250
	end,
	opts = {
		triggers_blacklist = {
			n = { "<LeftMouse>", "<2-LeftMouse>", "<3-LeftMouse>", "<4-LeftMouse>", "<LeftDrag>", "<LeftRelease>" },
			v = { "<LeftMouse>", "<2-LeftMouse>", "<3-LeftMouse>", "<4-LeftMouse>", "<LeftDrag>", "<LeftRelease>" },
		},
	},
}
