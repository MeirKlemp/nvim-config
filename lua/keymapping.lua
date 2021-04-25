local keymap = vim.api.nvim_set_keymap

-- setting the leader key to space
vim.g.mapleader = ' '

-- make indenting in visual mode and select mode with "<,>" not to return to normal mode
keymap('v', '<', '<gv', {noremap = true, silent = true})
keymap('v', '>', '>gv', {noremap = true, silent = true})

-- switch buffer with gb and gB
keymap('n', 'gb', ':bnext<CR>', {noremap = true, silent = true})
keymap('n', 'gB', ':bprev<CR>', {noremap = true, silent = true})

-- move selected line up and down in visual mode with J and K
keymap('x', 'K', ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
keymap('x', 'J', ":move '>+1<CR>gv-gv", {noremap = true, silent = true})
--
-- toggle full screen for neovide
if vim.g.neovide == true then
    keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
