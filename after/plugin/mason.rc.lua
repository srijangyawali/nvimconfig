local status, mason = pcall(require, 'mason')
if (not status) then
  print("Mason not found")
  return
end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then
  print("Mason lspconfig not found")
  return
end

mason.setup {}
lspconfig.setup {
  ensure_installed = { 'tailwindcss' }
}

require 'lspconfig'.tailwindcss.setup {}
