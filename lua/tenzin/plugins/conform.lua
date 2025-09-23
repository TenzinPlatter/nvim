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
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      bash = { "beautysh" },
      zsh = { "beautysh" },
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
