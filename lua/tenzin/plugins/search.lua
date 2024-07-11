vim.keymap.set(
	{ "n", "x" },
	"<leader>s",
	function() require("rip-substitute").sub() end,
	{ desc = " rip substitute" }
)

return {
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	keys = {
		{
			"<leader>fs",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
}
