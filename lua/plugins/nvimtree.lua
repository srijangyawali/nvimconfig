return {
	"nvim-tree/nvim-tree.lua",
	event = { "BufEnter" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- sync_root_with_cwd = true,
			respect_buf_cwd = true,
			disable_netrw = true,
			hijack_netrw = true,
			hijack_directories = {
				enable = true,
				auto_open = false,
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			view = {
				side = "right",
				centralized_selection = true,
				float = {
					enable = false,
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
