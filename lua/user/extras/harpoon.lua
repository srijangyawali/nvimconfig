local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()

  local wk = require "which-key"

  wk.register{
    ["<leader>hm"] = {"<cmd>lua require('user.extras.harpoon').mark_file()<cr>", "Mark file in harpoon"};
    ["<leader>ha"] = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "List harpoon marked files"},
  }

  vim.api.nvim_create_autocmd({ "filetype" }, {
    pattern = "harpoon",
    callback = function()
      vim.cmd [[highlight link HarpoonBorder TelescopeBorder]]
    end,

  })
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"

end

return M
