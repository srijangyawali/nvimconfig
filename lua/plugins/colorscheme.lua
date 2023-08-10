return {
	"catppuccin/nvim",
	dependencies = {
		{ "AlexvZyl/nordic.nvim" },
		{ "luisiacc/gruvbox-baby" },
	},
	event = { "BufEnter" },
	config = function()
		-- require("nordic").setup({
		-- transparent_bg= true,
		-- })
		require("catppuccin").setup({
			no_italic = false,
			flavour = "mocha",
			transparent_background = true,
			styles = {
				comments = { "italic" },
				keywords = { "italic" },
				conditionals = { "italic" },
				functions = { "italic" },
				booleans = { "bold" },
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
