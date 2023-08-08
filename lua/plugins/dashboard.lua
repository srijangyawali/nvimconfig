return{
	"glepnir/dashboard-nvim",
	event = {"VimEnter"},
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function ()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
      		'',
     			'',
   				'',
      		'',
      		'',
      		'',
      		'     ██████  ███████ ████████ ██████  ██ ███████     ',
      		'     ██   ██ ██         ██    ██   ██ ██ ██          ',
      		'     ██   ██ █████      ██    ██████  ██ ███████     ',
      		'     ██   ██ ██         ██    ██   ██ ██      ██     ',
      		'     ██████  ███████    ██    ██   ██ ██ ███████     ',
      		'',
      		'',
      		'You are not supposed to be here!',
      		'',
      		'',
    		},
				center = {
					{
						icon = '⏳ ',
						desc = 'Recent Files                       SPC f r',
						keymap = 'SPC f r',
						action = 'Telescope oldfiles'
					},
					{
						icon = '🔍 ',
						desc = 'Find files                         SPC f f',
						keymap = 'SPC f f',
						action = 'Telescope find_files'
					},
					{
						icon = '📂 ',
						desc = 'Toggle File Tree                   SPC t f',
						keymap = 'SPC t f',
						action = 'NvimTreeToggle'
					},
					{
						icon = '🟰 ',
						desc = 'Search word                        SPC f l',
						keymap = 'SPC f l',
						action = 'Telescope live_grep'
					},
				},
				footer = {'','','','⚠️  To exit neovim press :q followed by an enter. '},
			}
		})
	end
}
