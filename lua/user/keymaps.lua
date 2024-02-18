local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- seting leader key to space
keymap("n", "<Space>", "", opts)
-- mode, keymap, behavior, options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <C-i> and tab are same thing in neovim
keymap("n", "<C-i>", "<C-i>", opts)


-- Better window navigation
-- Using Vim tmux navigation
-- keymap("n", "<leader>wh", "<C-w>h", opts)
-- keymap("n", "<leader>wj", "<C-w>j", opts)
-- keymap("n", "<leader>wk", "<C-w>k", opts)
-- keymap("n", "<leader>wl", "<C-w>l", opts)
--keymap("n", "<m-tab>", "<c-6>", opts)

-- Splitting window
keymap("n", "<leader>wh", ":split<CR>", opts)
keymap("n", "<leader>wv", ":vsplit<CR>", opts)

-- center everything we search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)

keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- when we yank something and paste over something else, this changes the register value to the replaced value
keymap("x", "p", [["_dP]])

-- mouse menu options
vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]


vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

-- keymaps for debugging, here becuase we have F keys.
keymap("n", "<F1>", "<cmd>DapStepInto<cr>", opts)
keymap("n", "<F2>", "<cmd>DapStepOut<cr>", opts)
keymap("n", "<F3>", "<cmd>DapStepOver<cr>", opts)

keymap("n", "<leader>cw", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
