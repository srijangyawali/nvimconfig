local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.darkblue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
		z = { fg = colors.white, bg = colors.darkblue },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", hint = " ", info = " " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			icons_enabled = true,
		}

		local location = {
			"location",
			padding_right = 1,
			padding_left = 0,
		}

		local filename = {
			"filename",
			file_status = true,
			newfile_status = true,
			path = 3,
		}

		local customMode = {
			function()
				return ""
			end,
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1, left = 1 },
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				globalstatus = true,
				icons_enabled = true,
				disabled_filetypes = { "alpha", "dashboard" },
				-- always_divisible_middle = true,
				component_separators = { left = " ", right = " " },
				section_separators = { left = "", right = "" },
				colored = true,
			},
			sections = {
				lualine_a = { customMode },
				lualine_b = { "branch" },
				lualine_c = { diagnostics },
				lualine_x = { filename },
				lualine_y = { filetype, location },
				lualine_z = { "progress" },
			},
		})
	end,
}
