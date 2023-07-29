local status, toggleTerm = pcall(require, 'toggleterm')
if (not status) then
  print("Toggle term not found")
  return
end

toggleTerm.setup {
  size = 13,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  autochdir = true,
}
