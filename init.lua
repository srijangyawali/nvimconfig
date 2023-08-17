vim.api.nvim_set_hl(0,'Comment',{italic=true})
vim.cmd(
[[autocmd BufEnter * execute "cd" expand("%:p:h")]]
)
require("config.options")
require("config.lazy")
require("config.keymaps")

