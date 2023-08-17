-- defining the vim leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.autowrite = true -- automatically write changes when leaving the buffer
opt.background = "dark" --When set to dark, nvim will try to use colors that look good on a dark background.
opt.backup = false -- don't create a backup file
opt.completeopt = { "menu", "menuone", "preview", "noselect" } -- for completion popup
opt.conceallevel = 0 -- hides * markup for bold and italics
opt.fileencoding = "utf-8"
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m" -- filname, line number, column number, message
opt.hlsearch = true
opt.ignorecase = true
-- opt.autochdir = true
--opt.cursorline = true
opt.iskeyword:append("-") -- treats words sepearated with - a single word
opt.iskeyword:append("_")
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 15
opt.shiftround = true --round off indentation
opt.shiftwidth = 2 -- indentation level
opt.showtabline = 1 -- show buffer line when there are more than 1 buffers opened.
opt.showmode = false
opt.signcolumn = "yes" -- prevents the gitter in the working area when navigating up and down
opt.smartindent = true
opt.spelllang = { "en" }
opt.tabstop = 2
opt.termguicolors = true
opt.wrap = true
opt.writebackup = false

vim.cmd([[ 
filetype plugin indent on
syntax on
]])

vim.diagnostic.config({
	virtual_text = false, -- default true
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "if-many",
		header = "",
		prefix = "",
	},
})
