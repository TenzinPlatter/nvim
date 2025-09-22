return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = vim.lsp.config

			lspconfig("clangd",  {
				cmd = { "clangd", "--header-insertion=never" },
			})

			-- delete default lsp keybinds
			vim.keymap.del("n", "grr")
			vim.keymap.del("n", "gra")
			vim.keymap.del("n", "grn")
			vim.keymap.del("n", "gri")
		end,
		keys = {
			-- NOTE: references, definition, implementation is done in snacks
			{ "<leader>r", vim.lsp.buf.rename, desc = "Rename symbol under cursor" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Show code actions" },
			{ "K", vim.lsp.buf.hover, desc = "Show hover documentation" },
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
			},
		},
	},
}
