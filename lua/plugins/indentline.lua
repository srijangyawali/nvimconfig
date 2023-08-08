return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufEnter" },
	config = function()
		require("indent_blankline").setup({
			filetype_exclude = { "dashboard" },
			show_end_of_line = false,
			use_treesitter = true,
			use_treesitter_scope = true,
			show_current_context = true,
			show_trailing_blankline_indent = false,
		})
	end,
}
