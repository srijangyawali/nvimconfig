return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
			require("nvim-autopairs").setup({
				map_c_h = true, -- map the <C-h> key to delete a pair
				check_ts = true, -- treesitter integration
				ts_config = {
					lua = {"string", "source"},
					javascript = {"string", "template_string"},
					java = false,
				},
				enable_check_bracket_line = false, --check for bracket on the same line
				ignore_next_char = "[%w%.]", --don't add pair if next character is alphanumeric.
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
					})
				end,
}


