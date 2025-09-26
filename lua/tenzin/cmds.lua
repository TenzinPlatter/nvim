-- Autosave on exit of insert if text has been changed
-- remove space below to comment out autosave while editing config
--[[
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  nested = true,
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end

    if vim.bo.modifiable then
      vim.cmd("w")
      -- vim.lsp.buf.format({ bufnr = 0, async = false })
    end
  end,
})
-- ]]

-- Highlight Yanked area
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 300,
			on_visual = false,
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "h", "cpp", "hpp"},
  callback = function()
    vim.keymap.set('n', '<leader>sh', ':LspClangdSwitchSourceHeader<CR>', { buffer = true })
  end,
})
