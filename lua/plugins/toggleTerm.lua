return {
	"akinsho/toggleterm.nvim",
	event = { "BufEnter" },
	config = function()
		require("toggleterm").setup({
			hide_numbers = true,
			shade_terminals = true,
			auto_scroll = true,
			shading_factor = "1",
			start_in_insert = true,
			presist_size = true,
			direction = "horizontal",
			autochdir = true,
		})
	end,
}
