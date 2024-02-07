local M = {
	"folke/todo-comments.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	event = "BufEnter",
}


function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>oa"] = {"<cmd>TodoTelescope<CR>", "List all todo comments"};
  }
	require("todo-comments").setup({})
end

return M

