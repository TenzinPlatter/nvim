return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      python = { "ruff_format" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      yaml = { "yamlfmt" },
      rust = { "rustfmt" },
      ts = { "prettier" },
      js = { "prettier" },
      sh = { "beautysh" },
      bash = { "beautysh" },
      zsh = { "beautysh" },
      tsx = { "prettier" },
    },
    formatters = {
      ruff_format = {
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
      }
    },
  },
  keys = {
    {
      "<leader>=",
      function()
        require("conform").format()
      end,
      mode = { "n" },
    },
  },
}
