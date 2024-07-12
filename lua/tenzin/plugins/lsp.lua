return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		},
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"typos_lsp",
					"clangd",
					"jsonls",
					"jdtls",
					"tsserver",
					"lua_ls",
					"autotools_ls",
					"markdown_oxide",
					"jedi_language_server",
					"rust_analyzer"
				}

			})

			local my_capabilities = require('cmp_nvim_lsp').default_capabilities()

			local my_on_attach = function(client, bufnr)
				vim.keymap.set('n', '<leader>th', function()
					if vim.lsp.inlay_hint.is_enabled() then
						print("Disabling inlay hints")
					else
						print("Enabling inlay hints")
					end

					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end)

				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

				vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
				vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover)
			end

			local lspconfig = require("lspconfig")
			local handlers = {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function (server_name)
					lspconfig[server_name].setup({
						on_attach = my_on_attach,
						capabilities = my_capabilities
					})
				end,

				['rust_analyzer'] = function() end,

				["lua_ls"] = function ()
					 lspconfig.lua_ls.setup {
						on_attach = my_on_attach,
						capabilities = my_capabilities,
							 settings = {
									 Lua = {
											 diagnostics = {
													 globals = { "vim" }
											 }
									 }
							 }
					 }
				end,

				["ltex"] = function ()
				lspconfig.ltex.setup({
					on_attach = my_on_attach,
					capabilities = my_capabilities,
					settings = {
						ltex = {
							language = "en-GB"
						}
					}
				})
			end,
			}
		require("mason-lspconfig").setup({ handlers = handlers })
	end
	}
}
