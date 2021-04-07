vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>CommentaryLine', {silent = true})
vim.api.nvim_set_keymap('x', '<C-_>', '<Plug>Commentary gv', {silent = true})
vim.api.nvim_set_keymap('o', '<C-_>', '<Plug>Commentary', {silent = true})
