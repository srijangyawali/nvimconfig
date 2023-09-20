return {
	"nvim-telescope/telescope.nvim",
	event = { "VimEnter" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
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
						["q"] = actions.close,
					},
				},
			},
		})
		telescope.load_extension("fzf")

		--set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fu", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>bi", "<cmd>Telescope buffers<cr>", { desc = "Show all active buffers" })
		-- keymap.set("n", "<leader>.", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })
	end,
}
