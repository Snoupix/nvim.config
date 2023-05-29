vim.g.mapleader = " "
vim.api.nvim_set_option('timeoutlen', 500)
vim.keymap.set('n', "<leader>f", vim.cmd.Ex)

-- Ctrl+W +/-: increase/decrease height (ex. 20<C-w>+)
-- Ctrl+W >/<: increase/decrease width (ex. 30<C-w><)
-- Ctrl+W _: set height (ex. 50<C-w>_)
-- Ctrl+W |: set width (ex. 50<C-w>|)
-- Ctrl+W =: equalize width and height of all windows
-- See also: :help CTRL-W

vim.api.nvim_set_keymap('n', 'U', "<Cmd>redo<CR>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-c>", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<C-c>", ":CommentToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "gn", ":tabn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gp", ":tabp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gs", ":normal! ^<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gl", ":normal! $<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<C-w>q", ":bd<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', "<C-w>qf", ":bd!<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap('n', "<C-x>v", "<C-w>v<cmd>terminal<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', "<C-x>h", "<C-w>S<cmd>terminal<CR>", { noremap = false, silent = true })
