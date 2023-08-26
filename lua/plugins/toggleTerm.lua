return {
	"akinsho/toggleterm.nvim",
	event = { "VimEnter" },
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shading_factor = "1",
			shade_terminals = true,
			start_in_insert = true,
			auto_scroll = true,
			presist_size = true,
			direction = "horizontal",
			autochdir = true,
		})
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
