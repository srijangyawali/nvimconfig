return {
	"nvim-telescope/telescope.nvim",
	vent = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ahmedkhalf/project.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				initial_mode = "normal",
			},
		})
		require("project_nvim").setup({})
		require("telescope").load_extension("projects")
	end,
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
		{ "<leader>bi", "<cmd>Telescope buffers<cr>", desc = "Show all active buffers" },
	},
}
