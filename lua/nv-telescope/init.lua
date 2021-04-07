local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>gf', '<cmd>lua require"telescope.builtin".find_files()<CR>', {noremap = true})
keymap('n', '<leader>gg', '<cmd>lua require"telescope.builtin".live_grep()<CR>', {noremap = true})
keymap('n', '<leader>gb', '<cmd>lua require"telescope.builtin".buffers()<CR>', {noremap = true})
keymap('n', '<leader>gh', '<cmd>lua require"telescope.builtin".help_tags()<CR>', {noremap = true})
keymap('n', '<leader>gr', '<cmd>lua require"telescope.builtin".registers()<CR>', {noremap = true})
keymap('n', '<leader>gm', '<cmd>lua require"telescope.builtin".man_pages()<CR>', {noremap = true})
keymap('n', '<leader>gk', '<cmd>lua require"telescope.builtin".keymaps()<CR>', {noremap = true})

local actions = require"telescope.actions"
local sorters = require"telescope.sorters"
local previewers = require"telescope.previewers"

require"telescope".setup {
    defaults = {
        find_command = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = sorters.get_generic_fuzzy_sorters,
        shortern_path = true,
        winbled = 0,
        width = 0.75,
        preview_cutoff = 120,
        result_height = 1,
        result_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        color_devicon = true,
        use_less = true,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        mappings = {
            i = {
                -- replace Ctrl+x to Ctrl+s for split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.file_split,
            },
            n = {
                -- replace Ctrl+x to Ctrl+s for split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.file_split,
            }
        }
    }
}
