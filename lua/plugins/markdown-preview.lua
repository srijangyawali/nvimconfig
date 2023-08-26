return {
	"iamcco/markdown-preview.nvim",
	dependencies = {
		{ "dhruvasagar/vim-table-mode" },
	},
	event = { "BufEnter" },
	ft = "markdown",
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}

-- return {
-- 	"toppair/peek.nvim",
-- 	event = { "VimEnter" },
-- 	build = "deno task --quiet build:fast",
-- }
--
-- return {
-- 	"davidgranstrom/nvim-markdown-preview",
-- 	event = { "BufEnter" },
-- }
