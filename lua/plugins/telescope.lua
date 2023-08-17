return {
	"nvim-telescope/telescope.nvim",
	event = { "VimEnter" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},

	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					-- hijack_netrw = true,
				},
			},
			defaults = {
				initial_mode = "normal",
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
					},
				},
			},
		})
	end,
	cmd = "Telescope",

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
		{ "<leader>bi", "<cmd>Telescope buffers<cr>", desc = "Show all active buffers" },
	},
}
