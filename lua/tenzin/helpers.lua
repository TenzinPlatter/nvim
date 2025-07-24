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

return M
