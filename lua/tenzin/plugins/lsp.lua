return {
	{
		"neovim/nvim-lspconfig",
		config = function ()
			local lspconfig = require("lspconfig")

			lspconfig.clangd.setup({
				cmd = { "clangd", "--header-insertion=never" }
			})
		end
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim"
		},
		opts = {}
	}
}
