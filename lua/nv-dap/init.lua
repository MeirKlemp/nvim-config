local keymap = vim.api.nvim_set_keymap
local options = {silent = true}

keymap('n', '<leader>dp', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", options)
keymap('n', '<leader>dn', "<cmd>lua require'dap'.continue()<CR>", options)
keymap('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<CR>", options)
keymap('n', '<leader>d<CR>', "<cmd>lua require'dap'.step_into()<CR>", options)

require"dap"
vim.cmd "hi debugPC guibg=#4B4B18"
vim.cmd "hi debugBP guibg=#8C2F2F"
vim.fn.sign_define("DapBreakpoint", {text = '🛑', texhl = '', linehl = "debugBP", numhl = ''})
