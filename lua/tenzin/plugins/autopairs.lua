return {
	"https://github.com/windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		npairs.add_rule(Rule("<", ">"))
	end,
}
