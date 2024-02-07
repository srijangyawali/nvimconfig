local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    modules = {},
    auto_install = true,
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "c", "javascript", "cpp", "vimdoc" }, -- put the language you want in this array
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      disable = { "markdown" },
      additional_vim_regex_highlighting = false,
      -- for performance reasons
    },
    indent = {
      enable = true,
    },
  }
end

return M
