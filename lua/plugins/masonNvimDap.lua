return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"codelldb",
			},
		})
	end,
}
