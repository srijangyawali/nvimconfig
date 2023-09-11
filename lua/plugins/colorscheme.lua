return {
	"catppuccin/nvim",
	dependencies = {
		{ "AlexvZyl/nordic.nvim" },
		{ "shaunsingh/nord.nvim" },
		{ "aktersnurra/no-clown-fiesta.nvim" },
		{ "luisiacc/gruvbox-baby" },
		{ "bluz71/vim-nightfly-guicolors" },
		{ "rebelot/kanagawa.nvim" },
		{ "rmehri01/onenord.nvim" },
	},
	event = { "BufEnter" },
	-- name = 'nightfly',
	config = function()
		-- no-clown-fiesta setup
		-- require("no-clown-fiesta").setup({
		-- 	transparent = true,
		-- })
		--
		-- catppuccin setup
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
		--
		-- one nord configuration
		-- require("onenord").setup({
		-- 	theme = 'dark',
		-- 	disable = {
		-- 		background = true,
		-- 	}
		-- })
		--
		-- nightfly setup
		-- vim.g.nightflyTransparent = true
  --  	vim.g.nightflyNormalFloat = true
		--
		--
		-- kanagawa setup
		-- require('kanagawa').setup({
		-- 	transparent = true,
		-- })
		vim.cmd.colorscheme("catppuccin")
	end,
}
