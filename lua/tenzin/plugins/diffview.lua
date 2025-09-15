return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#4d1a1a" }) -- Dark red background
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#2d333b", fg = "#7d8590" }) -- GitHub's grey
		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2328" }) -- GitHub dark background
		vim.api.nvim_set_hl(0, "DiffText", { bg = "#1158a4", bold = true }) -- GitHub blue
		vim.opt.fillchars:append("diff:╱")
	end,
}
