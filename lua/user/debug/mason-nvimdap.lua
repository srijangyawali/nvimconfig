local M = {

	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
}

function M.config()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"codelldb",
			},
		})
	end

return M

