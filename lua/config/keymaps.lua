local keymap = vim.keymap.set
local opts = { silent = true }

-- Logical line movements
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

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

-- selecting the whole content
keymap("n", "<leader>va", "gg0vG$", opts)

-- moving around the buffer
keymap("n", "<leader>bn", ":bnext<cr>", opts)
keymap("n", "<leader>bp", ":bprevious<cr>", opts)

-- keymaps for debugging, here becuase we have F keys.
keymap("n", "<F1>", "<cmd>DapStepInto<cr>", opts)
keymap("n", "<F2>", "<cmd>DapStepOut<cr>", opts)
keymap("n", "<F3>", "<cmd>DapStepOver<cr>", opts)

-- function for floating window for toggle term
local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = Terminal:new({ direction = "float", dir = "%:p:h" })
	return float:toggle()
end

-- local Peek = require("peek").open

-- I installed project.nvim due to which the cwd of nvim stuck to the directory of the first opened file. While project was installed, the functions written below are the work around to open telescope and terminal in the directory of the current buffer.

-- opening normal terminal on path of current buffer
-- local toggle_term = function()
-- 	local term = Terminal:new({ direction = "horizontal", dir = "%:p:h" })
-- 	return term:toggle()
-- end
--
-- opening find files on path of current buffer
-- local findFiles = function()
-- 	local bufPath = vim.fn.expand("%:p:h")
-- 	vim.fn.execute("cd" .. bufPath)
-- 	require("telescope.builtin").find_files()
-- end
--
-- opening live grep on path of current buffer
-- local liveGrep = function()
-- 	local bufPath = vim.fn.expand("%:p:h")
-- 	vim.fn.execute("cd" .. bufPath)
-- 	require("telescope.builtin").live_grep()
-- end
--
-- for dap continue
-- local dapContinue = function()
-- 	local bufPath = vim.fn.expand("%:p:h")
-- 	vim.fn.execute("cd" .. bufPath)
-- 	require("dap").continue()
-- end

-- insert lazy git here

require("which-key").register({
	["<leader>f"] = {
		name = "+files",
		c = { "<cmd>e /home/creatio/.config/nvim/init.lua<cr>", "Open the init.lua file" },
	},
	["<leader>b"] = {
		name = "+buffers",
		c = { ":NvimTreeClose<cr><cmd>bdelete<cr>", "Delete current buffer" },
		-- whenever I tried to close a buffer with nvim tree open, it closed the whole neovim window
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
		r = { '<cmd>TermExec cmd="ranger" direction="float"<cr>', "Ranger" },
		-- To run this command ranger should be installed "sudo apt install ranger"
	},

	["<leader>m"] = {
		name = "+bookmarks",
		n = { require("nvim-tree.api").marks.navigate.next, "Move to next bookmarks" },
		p = { require("nvim-tree.api").marks.navigate.prev, "Move to previous bookmarks" },
	},

	["<leader>"] = {
		c = { require("nvim-tree.api").tree.change_root_to_node, "Change the current node as root" },
	},

	["<leader>g"] = {
		name = "+lsp_integrations",
	},

	["<leader>t"] = {
		name = "+toggle",
		t = { "<cmd>TroubleToggle<cr>", "Toggle trouble window" },
	},

	["<leader>h"] = {
		name = "+Git",
		b = { "<cmd> Gitsigns blame_line<cr>", "Blane line" },
		d = { "<cmd> Gitsigns diffthis<cr>", "Differential view" },
		p = { "<cmd> Gitsigns preview_hunk<cr>", "Preview the difference" },
	},

	["<leader>d"] = {
		name = "+debugging",
		b = { "<cmd>DapToggleBreakpoint<cr>", "Add a breakpoint" },
		r = { "<cmd>DapContinue<cr>", "Start or continue debugger" },
	},
})
