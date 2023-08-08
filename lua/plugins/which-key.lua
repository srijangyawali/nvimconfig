return{
	"folke/which-key.nvim",
	event = {"BufAdd", "BufEnter"},
	config = function()
		require("which-key").setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			window = {
				border = "single",
				position = "bottom",
				margin = {0,0,0,0},
				padding = {1,1,1,1},
			},
				})
			end,
}


