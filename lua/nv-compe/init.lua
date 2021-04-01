vim.o.completeopt = "menuone,noselect"

require"compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
	path = true,
	buffer = true,
	calc = true,
	nvim_lsp = true,
	nvim_lua = true,
	spell = true,
	vsnip = true,

	tags = false,
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- use tab and shift-tab to:
--- move to prev/next item in compelation menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
	return t "<C-n>"
    elseif vim.fn["vsnip#available"](1) == 1 then
	return t "<Plug>(vsnip-expand-or-jump)"
    else
	return t "<Tab>"
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
	return t "<C-p>"
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
	return t "<Plug>(vsnip-jump-prev)"
    else
	return t "<S-Tab>"
    end
end

local keymap = vim.api.nvim_set_keymap

keymap('i', "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap('s', "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap('i', "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap('s', "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

keymap('i', "<C-Space>", "compe#complete()", {expr = true})
keymap('i', "<CR>", "compe#confirm('<CR>')", {expr = true})
keymap('i', "<C-e>", "compe#close('<C-e>')", {expr = true})
keymap('i', "<C-f>", "compe#scroll({'delta' : +4})", {expr = true})
keymap('i', "<C-d>", "compe#scroll({'delta' : -4})", {expr = true})
