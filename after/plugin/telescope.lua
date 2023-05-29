local builtin = require('telescope.builtin')

-- <C-x> go to file selection as a split   
-- <C-v> go to file selection as a vsplit   
-- <C-t> go to a file in a new tab
vim.keymap.set('n', '<leader>af', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
