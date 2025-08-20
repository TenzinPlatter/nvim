return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      -- python = { "ruff" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      yaml = { "yamlfmt" },
      rust = { "rustfmt" },
      ts = { "prettier" },
      js = { "prettier" },
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
