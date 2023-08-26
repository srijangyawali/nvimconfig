return {
	"renerocksai/telekasten.nvim",
	event = { "VimEnter" },
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand("~/.nb/home"), -- Put the name of your notes directory here
			college = vim.fn.expand("~/Srijan/Class/College"),
		})
	end,
}
