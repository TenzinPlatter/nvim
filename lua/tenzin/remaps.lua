-- lsp stuff
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "h", "cpp", "hpp"},
  callback = function()
    vim.keymap.set('n', '<leader>sh', ':ClangdSwitchSourceHeader<CR>', { buffer = true })
  end,
})

vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")

-- Map 'a' to work with angle brackets in operator-pending mode
vim.keymap.set('o', 'ia', 'i<', { desc = 'inside angle brackets' })
vim.keymap.set('o', 'aa', 'a<', { desc = 'around angle brackets' })

-- Also add visual mode mappings for consistency
vim.keymap.set('x', 'ia', 'i<', { desc = 'inside angle brackets' })
vim.keymap.set('x', 'aa', 'a<', { desc = 'around angle brackets' })
vim.keymap.set("n", "zi", "za")

vim.keymap.set("n", "<C-S>", function()
  vim.cmd("wall")
end)

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

-- Navigate one screen line rather than actual line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- paste in insert from unnamed register
vim.keymap.set("i", "<C-f>", '<C-r>"')

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
vim.keymap.set("n", "<C-j>", "V:m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-k>", "V:m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "ZZ", ":wqa<CR>")

-- Show LSP hover for function when cursor is in parameter braces
vim.keymap.set("i", "<C-u>", function()
  require("tenzin.helpers").show_hover_in_function_params()
end)

vim.keymap.set("i", ">", function()
    local col = vim.fn.col(".")
    local line = vim.fn.getline(".")
    -- Only move right if there's already a > at cursor position
    if line:sub(col, col) == ">" then
        return "<Right>"
    else
        return ">"
    end
end, { expr = true, desc = "Move over existing >" })
