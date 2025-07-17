return {
  'stevearc/conform.nvim',
  opts = {
		formatters_by_ft = {
			python = { "black" },
			c = { "clang-format" },
      lua = { "stylua" },
      yaml = { "yamlfmt" },
		}
	},
	keys = {
		{"<leader>=", function() require("conform").format() end, mode = { "n" }},
	}
}
