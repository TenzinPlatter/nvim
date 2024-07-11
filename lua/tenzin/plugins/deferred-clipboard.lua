return {
	'https://github.com/EtiamNullam/deferred-clipboard.nvim',
	event = "VeryLazy",
	config = function()
		require('deferred-clipboard').setup({
			force_init_unnamed = true,
			fallback = 'unnamed'

		})
	end
}
