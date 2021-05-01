-- general mappings
require "plugins"
require "settings"
require "keymapping"
require "colorscheme"

-- plugins' configurations
require "nv-treesitter"
-- require "nv-indentline"
require "nv-compe"
require "nv-galaxyline"
require "nv-gitsigns"
require "nv-tree"
require "nv-commentary"
require "nv-telescope"
require "nv-flutter"

-- lsp
require "lsp"
require "lsp.lua-sumneko"
require "lsp.rust-analyzer"
require "lsp.c-cpp-clangd"
require "lsp.cmake-regen100"
require "lsp.pyright"

-- debugger
require "nv-dap"
require "nv-dap.c-cpp-rust"
require "nv-dap.python"
