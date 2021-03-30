vim.wo.wrap = true              -- set word wrapping
vim.o.termguicolors = true      -- set terminal gui colors
vim.o.t_Co = "256"              -- support 256 colors
vim.o.fileencoding = "utf-8"    -- set file encodings to utf-8
vim.cmd "syntax on"
vim.cmd "set tabstop=8"         -- set the tab's length to 8 spaces
vim.cmd "set shiftwidth=4"      -- set indent size to be 4 spaces, so no tabs will be inserted
vim.bo.expandtab = true         -- convert tabs to spaces
vim.bo.smartindent = true
vim.wo.number = true            -- show line numbers
vim.wo.relativenumber = true    -- show line numbers as a relative to current line
vim.wo.cursorline = true        -- highlight the current line
vim.wo.signcolumn = "yes"       -- force to show the signcolumn
vim.o.updatetime = 500          -- faster compelation
-- vim.o.timeoutlen = 250          -- wait 250ms before executing the current typed key
