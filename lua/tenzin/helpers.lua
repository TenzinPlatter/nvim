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

-- Create a highlight group for the temporary line highlight
vim.api.nvim_set_hl(0, "TempLineHighlight", {
	bg = "#3d4f5c", -- Adjust color to your preference
	-- Or use: link = 'CursorLine' to match your existing cursor line color
})

-- Function to temporarily highlight current line
local function highlight_current_line(delay)
	delay = delay or 0

	vim.defer_fn(function()
		local line = vim.api.nvim_win_get_cursor(0)[1]
		local ns_id = vim.api.nvim_create_namespace("temp_line_highlight")

		-- Clear any existing highlights
		vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

		-- Add highlight to current line (0-indexed, so line-1)
		vim.api.nvim_buf_add_highlight(0, ns_id, "TempLineHighlight", line - 1, 0, -1)

		-- Remove highlight after duration
		vim.defer_fn(function()
			vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
		end, 150) -- Highlight duration
	end, delay)
end

-- Track the last command used
vim.g.last_scroll_command = nil

-- Override specific scroll commands to track them
vim.keymap.set("n", "<C-u>", function()
	vim.g.last_scroll_command = "scroll"
	vim.cmd("normal! " .. vim.api.nvim_replace_termcodes("<C-u>", true, false, true))
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", function()
	vim.g.last_scroll_command = "scroll"
	vim.cmd("normal! " .. vim.api.nvim_replace_termcodes("<C-d>", true, false, true))
end, { noremap = true, silent = true })

-- Autocmd for cursor movements
vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		-- Check if this was a "big" jump by comparing with previous position
		local current_line = vim.api.nvim_win_get_cursor(0)[1]
		local last_line = vim.g.last_cursor_line or current_line

		-- Trigger highlight if jump was more than 5 lines
		if math.abs(current_line - last_line) > 5 then
			-- Use delay for scroll commands, no delay for others
			local delay = (vim.g.last_scroll_command == "scroll") and 300 or 0
			highlight_current_line(delay)
		end

		-- Reset the scroll command flag after a short delay
		if vim.g.last_scroll_command then
			vim.defer_fn(function()
				vim.g.last_scroll_command = nil
			end, 50)
		end

		vim.g.last_cursor_line = current_line
	end,
})

return M
