vim.keymap.set("n", "zi", "za")

vim.keymap.set("i", "<C-I>", '<C-R>"', { desc = "Paste from '\"' in insert" })

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("wall")
end)

vim.keymap.set("n", "ZZ", function()
	-- Save and close all non-terminal buffers
	local Terminal = require("sidekick.cli.terminal")
	local term = Terminal.get()
	if term then
		term:close()
	end
	-- require("persistence").save()
	-- for _, buf in ipairs(vim.api.nvim_list_bufs()) do
	-- 	if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype ~= "terminal" then
	-- 		if vim.bo[buf].modified then
	-- 			vim.api.nvim_buf_call(buf, function()
	-- 				vim.cmd("write")
	-- 			end)
	-- 		end
	-- 		vim.api.nvim_buf_delete(buf, { force = false })
	-- 	end
	-- end
	-- vim.cmd("quit")
end)

vim.keymap.set("i", "<C-T>", function()
	require("tenzin.helpers").insert_self()
end, { desc = "Insert self/this reference" })

vim.keymap.set("n", "<C-l>", "xp")
vim.keymap.set("n", "<C-h>", "xhP")

-- Copy selection to clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Highlight whole buffer
vim.keymap.set("n", "<leader>%", "ggVG")

-- Copy line to clipboard
vim.keymap.set("n", "<leader>yy", '"+yy')

-- Paste from clipboard
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>p", '"+p')

-- Navigate quick fix list
vim.keymap.set("n", "<leader>j", function()
	vim.cmd("cnext")
end)
vim.keymap.set("n", "<leader>k", function()
	vim.cmd("cprev")
end)
vim.keymap.set("n", "<leader>qf", function()
	vim.cmd("copen")
end)

-- Navigate one screen line rather than actual line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- clears highlight left after searching
vim.keymap.set("n", "<C-c>", function()
	vim.cmd("nohlsearch")
end)

-- make the window bigger vertically
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
-- make the window smaller vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
-- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
-- make the window smaller horizontally by pressing shift and -
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

-- move selection up/ down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- move line up/ down
vim.keymap.set("n", "<C-j>", "V:m '>+1<CR>gv=")
vim.keymap.set("n", "<C-k>", "V:m '<-2<CR>gv=")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Show LSP hover for function when cursor is in parameter braces
vim.keymap.set("i", "<C-u>", function()
	require("tenzin.helpers").show_hover_in_function_params()
end)

vim.keymap.set("i", "t", function()
	require("tenzin.helpers").insert_async_before_function()
end)
