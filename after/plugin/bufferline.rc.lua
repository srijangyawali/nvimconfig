local status, bufferline = pcall(require, 'bufferline')
if (not status) then
    print("Bufferline not found")
    return
end

bufferline.setup {
    options = {
        mode = 'buffers',
        separator_style = 'slope',
        always_show_bufferline = false,
        show_buffer_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        separator = {
            fg = '#073642',
            bg = '#002b36',
        },
        separator_selected = {
            fg = '#073642',
        },
        background = {
            fg = '#657b83',
            bg = '#002b36'
        },
        tab_selected = {
            fg = '#fdf6e3',
        },
        fill = {
            bg = '#073642'
        }
    }
}


vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
