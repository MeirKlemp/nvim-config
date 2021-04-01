local sumneko_root_path = vim.fn.stdpath("config") .. "/lsp/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

require"lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
	Lua = {
	    runtime = {
		-- version of lua, neovim is using LuaJIT
		version = "LuaJIT",
		-- lua path
		path = vim.split(package.path, ';'),
	    },

	    diagnostics = {
		-- get the language server to recognize the `vim` global
		globals = { "vim" },
	    },

	    workspace = {
		-- make the server aware of neovim runtime files
		library = {
		    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
		    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
		},
	    },

	    -- do not send telemetry data containing a randomized but uniqe identifier
	    telemetry = {
		enable = true,
	    },
	}
    }
}
