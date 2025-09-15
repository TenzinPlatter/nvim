return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2d1b29", fg = "#f7768e" }) -- Dark red bg, red text for deletions
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#292e42", fg = "#565f89" }) -- Grey bg/text for your version
		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1a1b26" }) -- Tokyo Night background
		vim.api.nvim_set_hl(0, "DiffText", { bg = "#394b70", bold = true }) -- Blue highlight for changed text
		vim.opt.fillchars:append("diff:╱")
	end,
}
