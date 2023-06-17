vim.g.mapleader = " "
vim.api.nvim_set_option('timeoutlen', 500)
vim.keymap.set('n', "<leader>f", vim.cmd.Ex)

-- Ctrl+W +/-: increase/decrease height (ex. 20<C-w>+)
-- Ctrl+W >/<: increase/decrease width (ex. 30<C-w><)
-- Ctrl+W _: set height (ex. 50<C-w>_)
-- Ctrl+W |: set width (ex. 50<C-w>|)
-- Ctrl+W =: equalize width and height of all windows
-- See also: :help CTRL-W

vim.api.nvim_set_keymap('n', 'U', "<cmd>redo<CR>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-c>", "<cmd>CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<C-c>", "<cmd>'<,'>CommentToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "gn", "<cmd>tabn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gp", "<cmd>tabp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gs", "<cmd>normal! ^<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gl", "<cmd>normal! $<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', "gs", "<cmd>normal! ^<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "gl", "<cmd>normal! $<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<C-w>qd", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-w>qdf", "<cmd>bd!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<C-x>v", "<C-w>v<cmd>terminal<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', "<C-x>h", "<C-w>S<cmd>terminal<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap('v', 'ms"', '<Esc>`>a"<Esc>`<i"<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', "ms'", "<Esc>`>a'<Esc>`<i'<Esc>", { noremap = true })
vim.api.nvim_set_keymap('v', "ms<", "<Esc>`>a><Esc>`<i<<Esc>", { noremap = true })
vim.api.nvim_set_keymap('v', "ms{", "<Esc>`>a}<Esc>`<i{<Esc>", { noremap = true })
vim.api.nvim_set_keymap('v', "ms(", "<Esc>`>a)<Esc>`<i(<Esc>", { noremap = true })
vim.api.nvim_set_keymap('v', "ms[", "<Esc>`>a]<Esc>`<i[<Esc>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-y>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-u>", "<C-u>zz", { noremap = true })

vim.api.nvim_set_keymap('x', "<leader>p", "\"_dP", { noremap = true })

vim.api.nvim_set_keymap('n', "<leader>y", "\"+y", { noremap = true })
vim.api.nvim_set_keymap('v', "<leader>y", "\"+y", { noremap = true })

vim.api.nvim_set_keymap('n', "<leader>d", "\"_d", { noremap = true })
vim.api.nvim_set_keymap('v', "<leader>d", "\"_d", { noremap = true })

vim.api.nvim_set_keymap('n', "n", "nzz", { noremap = false })
vim.api.nvim_set_keymap('n', "N", "Nzz", { noremap = false })
