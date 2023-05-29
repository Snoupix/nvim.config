vim.g.mapleader = " "
vim.api.nvim_set_option('timeoutlen', 500)
vim.keymap.set('n', "<leader>f", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', 'U', "<Cmd>redo<CR>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-c>", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<C-c>", ":CommentToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "gn", ":tabn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gp", ":tabp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gs", ":normal! ^<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gl", ":normal! $<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<C-w>q", ":bd<CR>", { noremap = false, silent = false })
