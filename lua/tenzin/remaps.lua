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
vim.keymap.set("n", "<C-j>", "V:m '>+1<CR>gv=")
vim.keymap.set("n", "<C-k>", "V:m '<-2<CR>gv=")

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
vim.keymap.set('n', 'gf', function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  
  local filepath, line_num, col_num
  
  -- Try to find markdown links in the entire line
  for link_text, url in line:gmatch('%[([^%]]+)%]%(([^%)]+)%)') do
    -- Check if cursor is within this link
    local link_start, link_end = line:find('%[' .. vim.pesc(link_text) .. '%]%(' .. vim.pesc(url) .. '%)', 1, false)
    
    if link_start and link_end and col >= link_start and col <= link_end then
      print("Found link - text:", link_text, "url:", url) -- Debug
      
      -- Parse the URL
      filepath, line_num, col_num = url:match("file://([^#]+)#L(%d+),(%d+)")
      if not filepath then
        filepath, line_num = url:match("file://([^#]+)#L(%d+)")
      end
      if not filepath then
        filepath = url:match("file://([^#]+)")
      end
      if not filepath then
        filepath, line_num, col_num = url:match("([^#]+)#L(%d+),(%d+)")
      end
      if not filepath then
        filepath, line_num = url:match("([^#]+)#L(%d+)")
      end
      if not filepath then
        filepath = url:gsub('#.*$', '')
      end
      break
    end
  end
  
  -- If no markdown link found, fall back to regular detection
  if not filepath then
    local cword = vim.fn.expand('<cWORD>')
    
    -- Try different patterns for line/column specification
    filepath, line_num, col_num = cword:match("([^:,]+):(%d+)[,:;](%d+)")
    
    if not filepath then
      filepath, line_num = cword:match("([^:,]+):(%d+)")
    end
    
    if not filepath then
      filepath, line_num, col_num = cword:match("([^#]+)#L(%d+),(%d+)")
    end
    
    if not filepath then
      filepath, line_num = cword:match("([^#]+)#L(%d+)")
    end
    
    if not filepath then
      filepath, line_num, col_num = cword:match("([^%(]+)%((%d+),(%d+)%)")
    end
    
    if not filepath then
      filepath, line_num = cword:match("([^%(]+)%((%d+)%)")
    end
    
    if not filepath then
      local cfile = vim.fn.expand('<cfile>')
      filepath = cfile:gsub('#.*$', '')
    end
  end
  
  if not filepath then
    print("No file path found")
    return
  end
  
  -- Clean up filepath
  filepath = filepath:gsub('^file://', '')
  filepath = filepath:gsub('^["\']', '')
  filepath = filepath:gsub('["\']$', '')
  filepath = filepath:gsub('#.*$', '')
  
  print("Cleaned filepath:", filepath) -- Debug
  
  -- Try to find the file
  local full_path = filepath
  
  if not filepath:match('^/') and not filepath:match('^[A-Za-z]:') then
    local current_dir = vim.fn.expand('%:p:h')
    local relative_path = current_dir .. '/' .. filepath
    
    if vim.fn.filereadable(relative_path) == 1 then
      full_path = relative_path
    else
      local found = vim.fn.findfile(filepath)
      if found ~= '' then
        full_path = found
      end
    end
  end
  
  print("Attempting to open:", full_path) -- Debug
  if line_num then
    print("Jump to line:", line_num, "column:", col_num or "0")
  end
  
  if vim.fn.filereadable(full_path) == 1 then
    vim.cmd('edit ' .. vim.fn.fnameescape(full_path))
    
    if line_num then
      local target_line = tonumber(line_num)
      local target_col = col_num and (tonumber(col_num) - 1) or 0
      
      local total_lines = vim.api.nvim_buf_line_count(0)
      if target_line > total_lines then
        target_line = total_lines
      end
      
      vim.api.nvim_win_set_cursor(0, {target_line, target_col})
      vim.cmd('normal! zz')
    end
  else
    print("File not found:", full_path)
  end
end, { desc = "Go to file with line/column number support" })
