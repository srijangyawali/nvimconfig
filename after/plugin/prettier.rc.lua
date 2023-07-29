local status, prettier = pcall(require, 'prettier')
if (not status) then
    print("Prettier not found")
    return
end

prettier.setup {
    bin = 'prettierd', -- install via npm install
    filetypes = {
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'scss',
        'c',
        'cpp'
    }
}
