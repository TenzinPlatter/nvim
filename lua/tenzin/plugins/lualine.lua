return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
			'nvim-tree/nvim-web-devicons',
			'f-person/git-blame.nvim'
		},
		config = function()
			local prose = require("nvim-prose")
			local git_blame = require('gitblame')
			-- This disables showing of the blame text next to the cursor
			vim.g.gitblame_display_virtual_text = 0
			require('lualine').setup({
				sections = {
					lualine_x = {
						{ prose.word_count, cond = prose.is_available }
					},
					lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } }
				}
			})
		end
}
