vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.api.nvim_set_keymap('i', "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["javascriptreact"] = true,
    ["typescript"] = true,
    ["typescriptreact"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["toml"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
}