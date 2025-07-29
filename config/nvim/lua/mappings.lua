vim.keymap.set('n', '<C-b>', ':NERDTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<C-f>', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', [[:lua split_line()<CR>]], { noremap = true, silent = true })
