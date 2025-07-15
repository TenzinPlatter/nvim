return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  init = function ()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<M-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<M-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<M-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<M-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  },
}
