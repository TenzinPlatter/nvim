return {
  "christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<M-h>",  ":TmuxNavigateLeft<cr>" },
		{ "<M-j>",  ":TmuxNavigateDown<cr>" },
		{ "<M-k>",  ":TmuxNavigateUp<cr>" },
		{ "<M-l>",  ":TmuxNavigateRight<cr>" },
		{ "<M-\\>", ":TmuxNavigatePrevious<cr>" },
	},
}

-- return {}
