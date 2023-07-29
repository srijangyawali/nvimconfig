local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  print("lsp config not found")
  return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  --formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
  vim.cmd [[command! Format execute 'lua vim.lsp.buf.format()']]
end


nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },
      workspace = {
        -- Make server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
    }
  }
}
-- Snippet support for css
<<<<<<< HEAD
local capabilities = vim.lsp.protocol.make_client_capabilities()
=======
local capabilities = protocol.make_client_capabilities()
>>>>>>> master
capabilities.textDocument.completion.completionItem.snippetSupport = true


nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
<<<<<<< HEAD
=======

nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
>>>>>>> master
