local keymap = vim.keymap.set
local opts = { silent = true }

-- Emacs like window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)

-- Splitting the screen like in emacs
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>ws", "<C-w>s", opts)

-- Changing the position of windows
keymap("n", "<leader>wL", "<C-w>L", opts)
keymap("n", "<leader>wK", "<C-w>K", opts)
keymap("n", "<leader>wJ", "<C-w>J", opts)
keymap("n", "<leader>wH", "<C-w>H", opts)

-- Moving the line up
keymap("n", "<C-j>", "ddp", opts)
keymap("n", "<C-k>", "ddkP", opts)

-- selecting the whole content
keymap("n", "<leader>va", "gg0vG$", opts)

-- moving around the buffer
keymap("n", "<leader>bn", ":bnext<cr>", opts)
keymap("n", "<leader>bp", ":bprevious<cr>", opts)

-- function for floating window for toggle term
local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

-- insert lazy git here

require("which-key").register({
	["<leader>f"] = {
		name = "+files",
	},
	["<leader>b"] = {
		name = "+buffers",
		d = { "<cmd>bdelete<cr>", "Delete current buffer" },
	},
	["<leader>v"] = {
		name = "+select",
	},
	["<leader>w"] = {
		name = "+window",
		c = { "<C-w>c", "Close the current window" },
	},
	["<leader>a"] = {
		a = { "vim.lsp.buf.format()", "formatter" },
	},
	["<leader>o"] = {
		name = "+open",
		t = { "<cmd>ToggleTerm<cr>", "Split below for terminal" },
		f = { toggle_float, "Floating terminal" },
	},

	["<leader>m"] = {
		name = "+bookmarks",
		n = { require("nvim-tree.api").marks.navigate.next, "Move to next bookmarks" },
		p = { require("nvim-tree.api").marks.navigate.prev, "Move to previous bookmarks" },
	},

	["<leader>"] = {
		c = { require("nvim-tree.api").tree.change_root_to_node, "Change the current node as root" },
	},
})
