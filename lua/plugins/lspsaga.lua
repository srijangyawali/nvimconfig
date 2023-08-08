return {
	"nvimdev/lspsaga.nvim",
	event = {"LspAttach"},
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
			}
		})
		end,
}
