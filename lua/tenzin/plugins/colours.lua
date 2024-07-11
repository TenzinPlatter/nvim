return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		'https://github.com/wilmanbarrios/palenight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require("palenight").set()
		end
	},
	{
		"https://github.com/folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"https://github.com/folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				styles = {
					functions = { italic = true }
				}
			})
			vim.cmd("colorscheme tokyonight")
		end
	},
	{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("cyberdream").setup({
					transparent = true,
				})

				vim.cmd("colorscheme cyberdream")
			end
	}
}
