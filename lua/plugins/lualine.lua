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

		require("lualine").setup({
			options = {
				theme = 'nord',
				globalstatus = true,
				icons_enabled = true,
				disabled_filetypes = { "alpha", "dashboard" },
				-- always_divisible_middle = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = " ", right = " " },
				colored = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diagnostics, diff },
				lualine_x = { filename },
				lualine_y = { filetype, location, "datetime" },
				lualine_z = { "progress" },
			},
		})
	end,
}
