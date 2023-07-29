local status, null_ls = pcall(require, 'null-ls')
if (not status) then
    print("Null ls not found")
    return
end

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        null_ls.builtins.diagnostics.flake8
    }
})
