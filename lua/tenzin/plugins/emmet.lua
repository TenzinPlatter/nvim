return {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      require("nvim-emmet").wrap_with_abbreviation()
      require("conform").format()
    end)
  end,
}
