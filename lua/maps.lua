local keymap = vim.keymap

keymap.set('n', 'x', '"_x') --Do not yank with x

-- Increment/ Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

--New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move between windows in cicular manner
keymap.set('n', '<Space>', '<C-w>w')

-- Move between the windows
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')

keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('', '<C-w><left>', '<C-w><')
keymap.set('', '<C-w><right>', '<C-w>>')
keymap.set('', '<C-w><up>', '<C-w>+')
keymap.set('', '<C-w><down>', '<C-w>')


-- Markdown Preview
keymap.set('', ';p', ':MarkdownPreview<cr>')
