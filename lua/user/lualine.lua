local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = false,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = false, -- Displays diagnostics status in color if set to true.
    always_visible = false, -- Show diagnostics even if there are none.

  }

  local filetype = {
    "filetype",
    colored = true,
    icon_only = true,
  }

  require("lualine").setup {

    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = {"mode", {"branch", icon =""} },
      lualine_b = { diff, filetype,"filename" },
      lualine_c = { diagnostics },
      lualine_x = { "location" },
      lualine_y = {'fileformat','encoding', "progress" },
      lualine_z = {{'datetime', style='%b-%d %I:%M %p'}},

    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
