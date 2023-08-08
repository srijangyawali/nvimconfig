local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	ui = {
		border = "rounded",

	},
	defaults = {
		lazy = true, 
		version = false, -- use the specific version of the package.
	},
	install = {
		missing = true,  -- install missing packages.
		colorscheme = {"habmax"},
	},
	checker = {
		enable = true, -- automatically check for plugin updates.
	},
	performance = {
		rtp = {
			disable_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			}
		}
	}
})
