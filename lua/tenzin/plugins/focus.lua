return {
	"https://github.com/nvim-focus/focus.nvim",
	opts = {},
	keys = { {
		"<C-W>m",
		function()
			vim.cmd("FocusMaxOrEqual")
		end,
		desc = "Toggle window fullscreen",
	} },
}
