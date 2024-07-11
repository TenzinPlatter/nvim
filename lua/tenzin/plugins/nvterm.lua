return {
	'https://github.com/zbirenbaum/nvterm',
	config = function()
		require("nvterm").setup({
			terminals = {
				type_opts = {
					float = {
						width = 0.9,
						height = 0.9,
					}
				}
			}
		})

		local nvterm = require("nvterm.terminal")
		vim.keymap.set('n', '<leader>h', function() nvterm.toggle("horizontal") end)
		vim.keymap.set('n', '<leader>j', function() nvterm.toggle("vertical") end)
		vim.keymap.set('n', '<leader>k', function() nvterm.toggle("float") end)

		-- exit insert mode
		vim.keymap.set('t', '<C-x>', '<C-\\><C-n>')
	end
}
