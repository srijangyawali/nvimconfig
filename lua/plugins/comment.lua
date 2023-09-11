return {
	"numToStr/Comment.nvim",
	event = { "BufAdd", "BufEnter" },
	config = function()
		require("Comment").setup({})
		-- This does not support typescript, look at the documentation for that.
	end,
}
