local status, autoparis = pcall(require, 'nvim-autopairs')
if (not status) then
    print("auto-pairs not found")
    return
end

autoparis.setup {
    disable_filetype = { 'TelescopePrompt', 'vim' }
}
