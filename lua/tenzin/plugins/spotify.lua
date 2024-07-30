return {
		'https://github.com/KadoBOT/nvim-spotify',
		dependencies = {'https://github.com/Rigellute/spotify-tui'},
		config = function ()
			local spotify = require('nvim-spotify')

			spotify.setup({
				status = {
					update_interval = 10000,
					format = "%s %t by %a"
				}
			})
		end,
		run = 'make',
}
