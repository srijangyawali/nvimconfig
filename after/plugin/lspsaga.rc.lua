local status, saga = pcall(require, 'lspsaga')
if (not status) then
  print("Lsp saga not found")
  return
end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  }
})


local opts = { noremap = true, silent = true }
-- Customize this further good documentation
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)

-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
-- vim.keymap.set('n', 'gf', '<Cmd>Lspsaga finder ref<cr>', opts)
-- -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<cr>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
-- vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
