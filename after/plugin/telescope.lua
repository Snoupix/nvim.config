local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-e>"] = actions.delete_buffer,
                ["<C-h>"] = actions.file_split,
                -- ["<C-t>"] = actions.select_default,
                ["<C-t>"] = actions.select_tab,
                -- ["<CR>"] = actions.select_tab,
                ["<CR>"] = actions.select_default,
                ["<C-s>"] = shorten_paths,
            },
            n = {
                ["<C-t>"] = actions.select_default,
                ["<CR>"] = actions.select_tab,
            }
        },
        trim_text = false,
    },
})

-- <C-x> go to file selection as a split => now <C-h>
-- <C-v> go to file selection as a vsplit
-- <C-t> go to a file in a new tab
-- <C-s> shorten the displyed path
vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ hidden = true, no_ignore = false })
end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fk', "<cmd>Telescope keymaps<CR>", {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>//', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
