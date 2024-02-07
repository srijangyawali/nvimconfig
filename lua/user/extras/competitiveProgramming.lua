function setup_cpp_makeprg()
    if vim.bo.filetype == 'cpp' then
        vim.bo.makeprg = 'g++ -o %:r % && ./%:r < input.txt > output.txt'
        vim.bo.errorformat = '%f:%l:%c:%m'
    end

end

vim.api.nvim_exec([[
    augroup cppMakeprg
        autocmd!

        autocmd FileType cpp lua setup_cpp_makeprg()
    augroup END
]], false)

function splitForCP()
  vim.cmd("vsplit input.txt")
  vim.cmd("split output.txt")
  vim.cmd("wincmd h")
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>cp", ":lua splitForCP()<CR>", opts)
