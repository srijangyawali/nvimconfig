return {
	"nvim-tree/nvim-tree.lua",
	event = { "BufEnter" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			actions = {
				change_dir = {
					enable = true,
					global = true,
				},
			},
			view = {
				side = "right",
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			diagnostics = {
				enable = true,
			},
			renderer = {
				highlight_git = true,
				root_folder_label = ":~:.",
				indent_markers = {
					enable = true,
				},
			},
		})
	end,
	keys = {
		{ "<leader>.", "<cmd>:NvimTreeToggle<cr>", desc = "Open nvim tree" },
	},
}
