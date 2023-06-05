local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
    print("Treesitter not found")
    return
end

ts.setup {
    markid = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {}
    },
    ensure_installed = {
        'lua',
        'json',
        'c',
        'cpp',
        'python',
        'markdown',
        'markdown_inline',
        'javascript',
        'css'
    },
    autotag = {
        enable = true,
    }
}
