-- helix stuff
vim.keymap.set("n", "gh", "0")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gs", "^")

-- Copy selection to clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Highlight whole buffer
vim.keymap.set("n", "<leader>a", "ggVG")

-- Copy line to clipboard
vim.keymap.set("n", "<leader>yy", '"+yy')

-- Paste from clipboard
vim.keymap.set("v", "<leader>p", '"+p')

-- Format entire buffer
vim.keymap.set("n", "<leader>=", "ggVG=")

-- Navigate quick fix list 
vim.keymap.set("n", "<leader>j", function() vim.cmd("cnext") end)
vim.keymap.set("n", "<leader>k", function() vim.cmd("cprev") end)

-- Navigate one screen line rather than actual line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- paste in insert from unnamed register
vim.keymap.set('i', '<C-f>', '<C-r>"')

-- when using gd (go definition), center text
vim.keymap.set('n', 'gd', 'gdzz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', 'n', 'nzz')

-- clears highlight left after searching
vim.keymap.set('n', '<leader>/', function() vim.cmd('nohlsearch') end)

-- make the window bigger vertically
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
-- make the window smaller vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
-- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
-- make the window smaller horizontally by pressing shift and -
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

-- move in insert with CTRL + h/j/k/l
vim.keymap.set('i', '<C-h>', '<left>')
vim.keymap.set('i', '<C-j>', '<down>')
vim.keymap.set('i', '<C-k>', '<up>')
vim.keymap.set('i', '<C-l>', '<right>')

-- move selection up/ down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- move line up/ down
vim.keymap.set("n", "<C-j>", "V:m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-k>", "V:m '<-2<CR>gv=gv")

-- keep highlight when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- keep highlight when indenting
vim.keymap.set('n', '>', 'V>gv')
vim.keymap.set('n', '<', 'V<gv')

vim.keymap.set('n', 'ZZ', ':wqa!<cr>')
