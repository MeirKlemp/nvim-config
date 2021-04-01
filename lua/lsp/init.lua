-- lsp keymapping
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", options)
keymap('n', 'gD', "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", options)
keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", options)
keymap('n', '<C-p>', "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", options)
keymap('n', '<C-n>', "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", options)
