require"lspconfig".pyright.setup {
    on_attach = require"lsp".common_on_attach,
    handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	    virtual_text = true,
	    signs = true,
	    underline = true,
	    update_in_insert = true,
	})
    }
}

vim.cmd [[
    command! RunPython :!python3 '%:p'
]]

