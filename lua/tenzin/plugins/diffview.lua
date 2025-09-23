return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
		})
		vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#34462F' })
		vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#462F2F' })
		vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2F4146' })
		vim.api.nvim_set_hl(0, 'DiffText', { bg = '#463C2F' })
		vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { bg = '#462F2F'})
		vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#462F2F'})
	end,
}
