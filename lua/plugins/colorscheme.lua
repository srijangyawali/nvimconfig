return {
	"catppuccin/nvim",
	dependencies = {
		{ "AlexvZyl/nordic.nvim" },
		{ "shaunsingh/nord.nvim" },
		{ "aktersnurra/no-clown-fiesta.nvim" },
		{ "ellisonleao/gruvbox.nvim" },
		{ "bluz71/vim-nightfly-guicolors" },
		{ "rebelot/kanagawa.nvim" },
		{ "rmehri01/onenord.nvim" },
		{ "romainl/Apprentice" },
		{ "mhartington/oceanic-next" },
		{ "sainnhe/everforest" },
	},
	event = { "BufEnter" },
	--=====================================--
	-- name = 'nightfly',
	config = function()
		-- no-clown-fiesta setup
		require("no-clown-fiesta").setup({
			transparent = true,
		})

		--=====================================--
		-- catppuccin setup
		require("catppuccin").setup({
			no_italic = false,
			flavour = "macchiato",
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

		--=====================================--
		-- gruvbox setup
		require("gruvbox").setup({
			transparent_mode = true,
		})

		--=====================================--
		-- one nord configuration
		require("onenord").setup({
			theme = "dark",
			disable = {
				background = true,
			},
		})

		--==================================--
		-- nightfly setup
		vim.g.nightflyTransparent = true
		vim.g.nightflyNormalFloat = true

		--=====================================--
		-- kanagawa setup
		require("kanagawa").setup({
			transparent = true,
		})

		--=====================================--
		-- everforest config
		vim.g.everforest_transparent_background = 2
		vim.g.everforest_ui_contrast = "high"
		vim.g.everforest_float_style = "bright"
		vim.g.everforest_diagnostic_text_highlight = 1
		vim.g.everforest_current_word = "underline"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_background = "soft"

		vim.cmd.colorscheme("everforest")
	end,
}
