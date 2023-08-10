return {
	"glepnir/dashboard-nvim",
	event = { "VimEnter" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				--This is for the DOOM Theme
				--
				--
				--
				-- header = {
				-- 	"",
				-- 	"",
				-- 	"",
				-- 	"",
				-- 	"",
				-- 	"",
				-- 	"     ██████  ███████ ████████ ██████  ██ ███████     ",
				-- 	"     ██   ██ ██         ██    ██   ██ ██ ██          ",
				-- 	"     ██   ██ █████      ██    ██████  ██ ███████     ",
				-- 	"     ██   ██ ██         ██    ██   ██ ██      ██     ",
				-- 	"     ██████  ███████    ██    ██   ██ ██ ███████     ",
				-- 	"",
				-- 	"",
				-- 	"You are not supposed to be here!",
				-- 	"",
				-- 	"",
				-- },
				--
				--
				-- center = {
				-- 	{
				-- 		icon = '⏳ ',
				-- 		desc = 'Recent Files                       SPC f r',
				-- 		keymap = 'SPC f r',
				-- 		action = 'Telescope oldfiles'
				-- 	},
				-- 	{
				-- 		icon = '🔍 ',
				-- 		desc = 'Find files                         SPC f f',
				-- 		keymap = 'SPC f f',
				-- 		action = 'Telescope find_files'
				-- 	},
				-- 	{
				-- 		icon = '📂 ',
				-- 		desc = 'Toggle File Tree                   SPC t f',
				-- 		keymap = 'SPC t f',
				-- 		action = 'NvimTreeToggle'
				-- 	},
				-- 	{
				-- 		icon = '🟰 ',
				-- 		desc = 'Search word                        SPC f l',
				-- 		keymap = 'SPC f l',
				-- 		action = 'Telescope live_grep'
				-- 	},
				-- },
				--
				--
				--This is for the HYPER Theme
				shortcut = {
					{ desc = "Update", icon = "☀️ ", action = "Lazy", key = "u" },
					{desc = "Search word", icon = '🟰 ', action = "Telescope live_grep", key = "g"},
					{desc = "Find files", icon = '📂 ', action = "NvimTreeToggle", key = "t"},
				},
				week_header = {
					enable = true,
				},

				-- Footer reamins same for both the themes
				footer = { "", "", "", "⚠️  To exit neovim press :q followed by an enter. " },
			},
		})
	end,
}
