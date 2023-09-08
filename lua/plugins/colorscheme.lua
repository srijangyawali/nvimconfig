return {
	"catppuccin/nvim",
	dependencies = {
		{ "AlexvZyl/nordic.nvim" },
		{ "shaunsingh/nord.nvim" },
		{ "aktersnurra/no-clown-fiesta.nvim" },
		{ "luisiacc/gruvbox-baby" },
		{"bluz71/vim-nightfly-colors"}
	},
	event = { "BufEnter" },
	name = 'nightfly',
	config = function()
		-- require("no-clown-fiesta").setup({
		-- 	transparent = true,
		-- })
		-- require("catppuccin").setup({
		-- 	no_italic = false,
		-- 	flavour = "mocha",
		-- 	transparent_background = true,
		-- 	styles = {
		-- 		comments = { "italic" },
		-- 		keywords = { "italic" },
		-- 		conditionals = { "italic" },
		-- 		functions = { "italic" },
		-- 		booleans = { "bold" },
		-- 	},
		-- 	integrations = {
		-- 		cmp = true,
		-- 		gitsigns = true,
		-- 		nvimtree = true,
		-- 	},
		-- })
		vim.g.nightflyTransparent = true
		vim.cmd.colorscheme("nightfly")
	end,
}
