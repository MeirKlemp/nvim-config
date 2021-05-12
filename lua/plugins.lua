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

    -- reload init.lua
    use "famiu/nvim-reload"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "glepnir/lspsaga.nvim"

    -- debugger
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"

    -- autocomplete
    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "rafamadriz/friendly-snippets"

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    -- NOTE: this plugin sometimes highlights empty rows and it is annoying...
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- commenting
    use "tpope/vim-commentary"
    -- TODO: learn how to use this plugin
    -- use "JoosepAlviste/nvim-ts-context-commentstring"

    -- colors
    use "christianchiarulli/nvcode-color-schemes.vim"

    -- icons
    use "kyazdani42/nvim-web-devicons"

    -- statusline
    use "glepnir/galaxyline.nvim"

    -- file system
    use "kyazdani42/nvim-tree.lua"

    -- git
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim"
        }
    }

    -- flutter
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
end)

