local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-h>"] = actions.file_split,
                ["<C-t>"] = actions.select_default,
                ["<CR>"] = actions.select_tab,

            },
            n = {
                ["<C-t>"] = actions.select_default,
                ["<CR>"] = actions.select_tab,
            }
        },
    },
})

-- <C-x> go to file selection as a split => now <C-h>
-- <C-v> go to file selection as a vsplit
-- <C-t> go to a file in a new tab
vim.keymap.set('n', '<leader>af', function()
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ hidden = true, no_ignore = false })
end, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
