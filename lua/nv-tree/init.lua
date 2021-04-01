-- settings
vim.g.nvim_tree_indent_markers = 1

-- keymapping inside the tree
local tree_cb = require"nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["<CR>"]    = tree_cb("edit"),
    ["l"]       = tree_cb("edit"),
    ["o"]       = tree_cb("edit"),
    ["<C-]>"]   = tree_cb("cd"),
    ["v"]       = tree_cb("vsplit"),
    ["s"]       = tree_cb("split"),
    ["<C-t>"]   = tree_cb("tabnew"),
    ["h"]       = tree_cb("close_node"),
    ["<BS>"]    = tree_cb("close_node"),
    ["<S-CR>"]  = tree_cb("close_node"),
    ["<Tab>"]   = tree_cb("preview"),
    ["I"]       = tree_cb("toggle_ignored"),
    ["H"]       = tree_cb("toggle_dotfiles"),
    ["R"]       = tree_cb("refresh"),
    ["a"]       = tree_cb("create"),
    ["d"]       = tree_cb("remove"),
    ["r"]       = tree_cb("rename"),
    ["<C-r>"]   = tree_cb("full_rename"),
    ["x"]       = tree_cb("cut"),
    ["c"]       = tree_cb("copy"),
    ["p"]       = tree_cb("paste"),
    ["[c"]      = tree_cb("prev_git_item"),
    ["]c"]      = tree_cb("next_git_item"),
    ["-"]       = tree_cb("dir_up"),
    ["q"]       = tree_cb("close")
}

-- keymapping outside the tree
vim.api.nvim_set_keymap('n', "<leader>f", ":NvimTreeToggle<CR>", {noremap = true})

-- icons
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
