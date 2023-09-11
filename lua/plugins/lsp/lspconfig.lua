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

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", "vim.lsp.buf.code_action", opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", "vim.diagnostics.open_float", opts)

			opts.desc = "Goto next diagnostics"
			keymap.set("n", "]d", "vim.diagnostics.goto_next", opts)

			opts.desc = "Goto previous diagnostics"
			keymap.set("n", "[d", "vim.diagnostics.goto_prev", opts)

			opts.desc = "Show documentation for what is under the cursor"
			keymap.set("n", "<leader>k", "vim.lsp.buf.hover", opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LSPRestart<CR>", opts)
		end

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "🪲", Warn = "⚠ ", Info = "🛈 ", Hint = "🕯️" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		require("lspconfig")["lua_ls"].setup({
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

		require("lspconfig")["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig")["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig")["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig")["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		capabilities.offsetEncoding = { "utf-16" }
		require("lspconfig")["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.api.nvim_exec_autocmds("FileType", {}) -- to automatically open lsp in the first file.
	end,
}
