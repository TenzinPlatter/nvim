return {
	"https://github.com/mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set('n', '<leader><C-s>', function() require('dap').repl.open() end)
		vim.keymap.set('n', '<leader><C-f>', function() require('dap').step_over() end)
		vim.keymap.set('n', '<leader><C-d>', function() require('dap').step_into() end)
		vim.keymap.set('n', '<leader><C-b>', function() require('dap').toggle_breakpoint() end)
		vim.keymap.set('n', '<leader><C-j>', function() require('dap').continue() end)
	end
}
