return {
	"catppuccin/nvim",
	event = { "BufEnter" },
	config = function()
		require("catppuccin").setup({
			no_italic = false,
			flavour = "mocha",
			transparent_background = false,
			styles = {
				comments = { "italic" },
				keywords = { "italic" },
				conditionals = { "italic" },
				functions = { "italic" },
				booleans = {"bold"},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
