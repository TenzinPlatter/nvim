return {
	{
		"https://github.com/rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
		end,
	},
	{
		"https://github.com/rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					transparency = true,
					bold = false,
					italic = false,
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = true,
		},
	},
	{
		"https://github.com/aktersnurra/no-clown-fiesta.nvim",
		config = function()
			require("no-clown-fiesta").setup({
				transparent = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"https://github.com/folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
			})
		end,
	},
	{
		"https://github.com/projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = { transparent = true },
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
	{
		"vague2k/huez.nvim",
		-- if you want registry related features, uncomment this
		import = "huez-manager.import",
		branch = "stable",
		event = "UIEnter",
		opts = {},
		keys = {
			{
				"<leader>tp",
				function()
					vim.cmd("Huez")
				end,
				desc = "Theme picker",
			},
		},
	},
}
