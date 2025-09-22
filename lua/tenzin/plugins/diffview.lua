return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#28a745', fg = '#ffffff' })
		vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#d73a49', fg = '#ffffff' })
		vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#ffeaa7', fg = '#000000' })
		vim.api.nvim_set_hl(0, 'DiffText', { bg = '#fdcb6e', fg = '#000000', bold = true })

		-- Additional GitHub-style diff highlights
		vim.api.nvim_set_hl(0, 'diffAdded', { fg = '#28a745' })
		vim.api.nvim_set_hl(0, 'diffRemoved', { fg = '#d73a49' })
		vim.opt.fillchars:append("diff:╱")
	end,
}
