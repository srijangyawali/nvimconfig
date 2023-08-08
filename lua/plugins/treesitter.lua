return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = {"BufAdd", "BufEnter"},
	dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"},
	config = function()
		require'nvim-treesitter.configs'.setup {
  		ensure_installed = { "c", "lua", "vim", "vimdoc", "query","cpp","markdown","markdown_inline" },

  		sync_install = false,

  		auto_install = true,

  		ignore_install = { "javascript" },

  		highlight = {
    		enable = true,
  		},

			markid = {
				enable = true,
			},

			autopairs = {
				enable = true,
			},

			indent = {enable = true},

			context_commentstring = {
				enable = true,
			},
		}
		local function update_hl( group, tbl )
    	local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    	local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    	vim.api.nvim_set_hl( 0, group, new_hl )
		end
		update_hl( 'Comment', { italic = true } )

	end,
	}
