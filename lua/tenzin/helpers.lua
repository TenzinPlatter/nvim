local M = {}

function M.show_hover_in_function_params()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line = cursor_pos[1] - 1
  local col = cursor_pos[2]

  local line_text = vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1]
  if not line_text then
    return
  end

  local function_start = nil
  local paren_count = 0
  local in_params = false

  for i = col, 1, -1 do
    local char = line_text:sub(i, i)
    if char == ")" then
      paren_count = paren_count + 1
    elseif char == "(" then
      if paren_count == 0 then
        function_start = i - 1
        in_params = true
        break
      else
        paren_count = paren_count - 1
      end
    end
  end

  if in_params and function_start then
    local function_name_end = function_start
    while function_name_end > 0 do
      local char = line_text:sub(function_name_end, function_name_end)
      if char:match("[%w_]") then
        function_name_end = function_name_end - 1
      else
        break
      end
    end

    if function_name_end < function_start then
      vim.api.nvim_win_set_cursor(0, { line + 1, function_name_end })
      vim.lsp.buf.hover()
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
  end
end

-- Only show cursorline in the active window
vim.api.nvim_create_augroup("CursorLineOnlyInActiveWindow", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = "CursorLineOnlyInActiveWindow",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "CursorLineOnlyInActiveWindow",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

function M.insert_self()
  local filetype = vim.bo.filetype
  local self_ref = ""

  if filetype == "cpp" or filetype == "c" then
    self_ref = "this->"
  elseif filetype == "python" then
    self_ref = "self."
  elseif filetype == "javascript" or filetype == "typescript" or filetype == "javascriptreact" or filetype == "typescriptreact" then
    self_ref = "this."
  elseif filetype == "java" or filetype == "kotlin" then
    self_ref = "this."
  elseif filetype == "csharp" then
    self_ref = "this."
  elseif filetype == "rust" then
    self_ref = "self."
  elseif filetype == "go" then
    self_ref = "self."
  elseif filetype == "ruby" then
    self_ref = "self."
  elseif filetype == "php" then
    self_ref = "$this->"
  elseif filetype == "swift" then
    self_ref = "self."
  elseif filetype == "lua" then
    self_ref = "self."
  else
    self_ref = "self."
  end

  vim.api.nvim_put({self_ref}, "c", false, true)
end

function M.insert_async_before_function()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1] - 1
  local col = cursor_pos[2]

  local parser = vim.treesitter.get_parser(bufnr)
  if not parser then
    vim.notify("No tree-sitter parser available", vim.log.levels.ERROR)
    return
  end

  local tree = parser:parse()[1]
  if not tree then
    vim.notify("Failed to parse tree", vim.log.levels.ERROR)
    return
  end

  local root = tree:root()
  local current_node = root:named_descendant_for_range(row, col, row, col)

  if not current_node then
    vim.notify("No node found at cursor", vim.log.levels.WARN)
    return
  end

  -- Function node types for different languages
  local function_node_types = {
    "function_declaration",
    "function_definition",
    "function",
    "arrow_function",
    "method_declaration",
    "method_definition",
    "function_item",
    "lambda",
  }

  -- Traverse up the tree to find a function node
  local function_node = current_node
  while function_node do
    local node_type = function_node:type()
    local is_function = false
    for _, ft in ipairs(function_node_types) do
      if node_type == ft then
        is_function = true
        break
      end
    end
    if is_function then
      break
    end
    function_node = function_node:parent()
  end

  if not function_node then
    vim.notify("Not inside a function", vim.log.levels.WARN)
    return
  end

  -- Get the start position of the function node
  local start_row, start_col = function_node:start()

  -- For most languages, we need to find the 'function' keyword or the start of the declaration
  -- We'll insert 'async ' at the start of the function node
  local line_text = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]

  -- Find the position to insert 'async'
  -- Check if 'async' already exists
  if line_text:match("^%s*async%s") or line_text:match("^%s*export%s+async%s") then
    return
  end

  -- Determine insertion position
  local insert_col = start_col
  local prefix = line_text:sub(1, start_col)

  -- Handle 'export' keyword for JS/TS
  local export_match = prefix:match("^(%s*export%s+)")
  if export_match then
    insert_col = #export_match
  end

  -- Insert 'async '
  vim.api.nvim_buf_set_text(bufnr, start_row, insert_col, start_row, insert_col, {"async "})
  vim.notify("Inserted 'async' before function", vim.log.levels.INFO)
end

return M
