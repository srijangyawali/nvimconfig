return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufEnter",
	dependencies = {
		{ "lukas-reineke/lsp-format.nvim" },
	},
	config = function()
		local null_ls = require("null-ls")
		local b = null_ls.builtins
		local sources = {
			b.formatting.clang_format,
			b.formatting.stylua,
		}
		null_ls.setup({
			on_init = function(new_client, _)
				new_client.offset_encoding = "utf-16"
			end,
			sources = sources,
			on_attach = function(client)
				require("lsp-format").on_attach(client) -- format on save
			end,
		})
	end,
}
