vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", options)
keymap('n', 'gD', "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", options)
keymap('n', 'gp', ":Lspsaga preview_definition<CR>", options)
keymap('n', 'gh', ":Lspsaga lsp_finder<CR>", options)
keymap('n', 'K', ":Lspsaga hover_doc<CR>", options)
keymap('n', 'cr', ":Lspsaga rename<CR>", options)
keymap('n', '<C-h>', ":Lspsaga code_action<CR>", options)
keymap('n', '<C-p>', ":Lspsaga diagnostic_jump_prev<CR>", options)
keymap('n', '<C-n>', ":Lspsaga diagnostic_jump_next<CR>", options)
keymap('n', '<C-d>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", options)
keymap('n', '<C-f>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", options)
keymap('n', '<leader>f', "<cmd>lua vim.lsp.buf.formatting()<CR>", options)

local lsp_config = {}
lsp_config.common_on_attach = function (client, bufnr) end

return lsp_config
