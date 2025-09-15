return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#4a1f1f" }) -- Dark red for deletions
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a3a3a", fg = "#888888" }) -- Grey for your version
		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3a3a1f" }) -- Keep change highlighting
		vim.api.nvim_set_hl(0, "DiffText", { bg = "#4a4a1f", bold = true }) -- Keep text highlighting
		vim.opt.fillchars:append("diff:╱")
	end,
}
