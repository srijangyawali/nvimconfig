return {
	"simrat39/symbols-outline.nvim",
	config = function()
		require("symbols-outline").setup({
			wrap = true,
		})
	end,
	keys = {
		{ "<leader>ts", "<cmd>SymbolsOutline<cr>", "Get the symbol outline" },
	},
}
