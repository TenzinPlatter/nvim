return {
  'stevearc/conform.nvim',
  opts = {
		formatters_by_ft = {
			python = { "black" },
			c = { "clang-format" }
		}
	},
	keys = {
		{"<leader>=", function() require("conform").format() end, mode = { "n" }},
	}
}
