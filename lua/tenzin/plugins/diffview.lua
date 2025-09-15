return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#34462F" })
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#462F2F" })
		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2F4146" })
		vim.api.nvim_set_hl(0, "DiffText", { bg = "#463C2F" })
		vim.opt.fillchars:append("diff:╱")
	end,
}
