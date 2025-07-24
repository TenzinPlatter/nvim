return {
	"https://github.com/windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.add_rule(Rule("<", ">"):with_move(function(opts)
			return opts.char == ">"
		end):with_pair(function()
			return true
		end))
	end,
}
