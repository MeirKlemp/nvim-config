local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- install packer if is not already installed
if fn.empty(fn.glob(install_path)) > 0 then
    if fn.input("Packer.nvim was not found, do you want to install it? type 'y' for yes ") ~= 'y' then
	return
    end

    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

-- auto compile when there are changes to this file
execute "autocmd BufWritePost plugins.lua PackerCompile"

require("packer").startup(function(use)
    -- packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"

    -- autocomplete
    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "rafamadriz/friendly-snippets"

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- colors
    use "christianchiarulli/nvcode-color-schemes.vim"

end)

