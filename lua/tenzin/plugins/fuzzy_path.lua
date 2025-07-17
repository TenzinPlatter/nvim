return {
  "tzachar/cmp-fuzzy-path",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope-fzf-native.nvim",
    "tzachar/fuzzy.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
  },
}
