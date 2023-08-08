return {
	"RRethy/vim-illuminate",
	event = { "BufEnter" },
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
			},
			delay = 10,
			under_cursor = true,
		})
	end,
}
