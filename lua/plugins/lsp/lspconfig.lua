return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		local on_attach = function()
			keymap.set("n", "<leader>gh", vim.lsp.buf.hover, { buffer = 0, desc = "Hover documentation" }, opts)

			keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0, desc = "Go to definiton" }, opts)
			-- We can use CTRL-T to go back

			keymap.set(
				"n",
				"<leader>gi",
				vim.lsp.buf.implementation,
				{ buffer = 0, desc = "Go to implementation" },
				opts
			)

			keymap.set(
				"n",
				"<leader>dj",
				vim.diagnostic.goto_next,
				{ buffer = 0, desc = "Go to next diagnostic" },
				opts
			)

			keymap.set(
				"n",
				"<leader>dk",
				vim.diagnostic.goto_prev,
				{ buffer = 0, desc = "Go to previous diagnostic" },
				opts
			)

			keymap.set(
				"n",
				"<leader>gT",
				vim.lsp.buf.type_definition,
				{ buffer = 0, desc = "Go to type definiton" },
				opts
			)

			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" }, opts)

			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }, opts)

			keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" }, opts)
		end

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "🪲", Warn = "⚠ ", Info = "🛈 ", Hint = "🕯️" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,

			["clangd"] = function()
				capabilities.offsetEncoding = { "utf-16" }
				lspconfig["clangd"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})

		vim.api.nvim_exec_autocmds("FileType", {}) -- to automatically open lsp in the first file.
	end,
}
