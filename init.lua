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

-- disable deprecated messages on startup
vim.deprecate = function() end
-- inline diagnositcs
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

vim.cmd("colorscheme rose-pine")

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "Black" })
-- vim.api.nvim_set_hl(0, 'Cursor', { bg = '#666666', fg = '#ffffff' })

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

-- for obsidian.nvim
vim.opt.conceallevel = 1

vim.opt.cursorline = true
-- vim.opt.cursorlineopt = 'number'
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.colorcolumn = "80"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.linebreak = true

-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4

vim.opt.rnu = true
vim.opt.nu = true
