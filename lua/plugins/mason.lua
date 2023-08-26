return {
	"williamboman/mason.nvim",
	event = { "BufEnter" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
				-- "codelldb", manually installed
			},
			-- All these plugins are installed in ~/.local/share/nvim/mason/packages
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true -- adding lsp capabilities

		require("lspconfig")["lua_ls"].setup({
			capabilities = capabilities,
		})
		require("lspconfig")["html"].setup({
			capabilities = capabilities,
		})
		require("lspconfig")["texlab"].setup({
			capabilities = capabilities,
		}) 
		capabilities.offsetEncoding = { "utf-16" }
		require("lspconfig")["clangd"].setup({
			capabilities = capabilities,
		})

		vim.api.nvim_exec_autocmds("FileType", {}) -- to automatically open lsp in the first file.
	end,
	keys = {
		{ "<leader>gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
		{ "<leader>gh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Documentation" },
		{ "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show line Diagnostics" },
		{ "<leader>ol", "<cmd>LspInfo<cr>", desc = "Open LspInfo" },
		{ "<leader>om", "<cmd>Mason<cr>", desc = "Open Mason" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Power rename" },
	},

	-- INFO: Install the trouble.nvim plugin when you are ready to see a larger code base
}
