return{
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local mason = require("mason")

	local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✔ ",
					package_pending = "⇾ ",
					package_uninstalled = "⛌ ",
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,
		})
	end
}
