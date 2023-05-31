require("snoupix")

vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
vim.cmd [[highlight SignColumn guibg=NONE]]

-- local filepath = vim.fn.expand('%:p:h')
-- local gitdir = vim.fn.finddir('.git', filepath .. ';')
-- if gitdir and #gitdir > 0 and #gitdir < #filepath then
--     require("telescope.builtin").git_files()
-- else
--     require("telescope.builtin").find_files()
-- end
