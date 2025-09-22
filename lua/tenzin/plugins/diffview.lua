return {
	"https://github.com/sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
		})

		-- Tokyo Night inspired diff colors for diffview
		-- Soothing, low-contrast colors that are easy on the eyes

		-- Standard diff highlights with Tokyo Night palette
		vim.api.nvim_set_hl(0, "DiffAdd", {
			bg = "#20303b",
			fg = "#73daca",
		})

		vim.api.nvim_set_hl(0, "DiffDelete", {
			bg = "#2d202a",
			fg = "#f7768e",
		})

		vim.api.nvim_set_hl(0, "DiffChange", {
			bg = "#32344a",
			fg = "#7dcfff",
		})

		vim.api.nvim_set_hl(0, "DiffText", {
			bg = "#394b70",
			fg = "#c0caf5",
			bold = true,
		})

		-- New diffview-specific highlight groups
		vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", {
			bg = "#2d202a",
			fg = "#f7768e",
		})

		vim.api.nvim_set_hl(0, "DiffviewDiffDelete", {
			bg = "#1f1f23",
			fg = "#565f89",
		})

		-- Additional Tokyo Night diff styling
		vim.api.nvim_set_hl(0, "diffAdded", { fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "diffRemoved", { fg = "#f7768e" })
		vim.api.nvim_set_hl(0, "diffChanged", { fg = "#7dcfff" })

		-- Line numbers in diff view
		vim.api.nvim_set_hl(0, "DiffviewStatusLine", {
			bg = "#1a1b26",
			fg = "#a9b1d6",
		})
		vim.opt.fillchars:append("diff:╱")
	end,
}
