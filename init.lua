vim.g.mapleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("tenzin.plugins", {})
require("tenzin.remaps")
require("tenzin.helpers")

-- colorizer has to be setup after
require("colorizer").setup()

-- set highlight colours
vim.api.nvim_set_hl(0, "Visual", { bg = "#666666" })
-- vim.cmd('hi MatchParen guibg=White')
vim.cmd("hi Search guibg=#FEFFA7")
-- vim.cmd('hi CursorLineNr guibg=White')
vim.cmd("hi ColorColumn guibg=Black")

-- disables netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set nvim tree background transparent
vim.cmd("hi NvimTreeNormal guibg=None ctermbg=None")
vim.cmd("set mouse=n")
