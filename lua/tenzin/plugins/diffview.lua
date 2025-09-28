return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
		})
		vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#34462F' })
		vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#462F2F' })
		vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2F4146' })
		vim.api.nvim_set_hl(0, 'DiffText', { bg = '#462F2F' })
		-- to stop it from linking to DiffText
		vim.cmd('highlight clear DiffTextAdd')
		-- vim.api.nvim_set_hl(0, 'DiffTextAdd', { bg = '#462F2F' })
		vim.api.nvim_set_hl(0, 'DiffTextAdd', { bg = 'green' })
		vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { bg = 'red'})
		vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = 'red'})
	end,
}
