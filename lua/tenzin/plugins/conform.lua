return {
  'stevearc/conform.nvim',
  opts = {
		formatters_by_ft = {
			python = { "black" },
		}
	},
	keys = {
		{"<leader>=", function() require("conform").format() end, mode = { "n" }},
	}
}
