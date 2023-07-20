vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
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
    ["gomod"] = true,
    ["python"] = true,
    ["html"] = true,
    ["css"] = true,
    ["scss"] = true,
    ["haskell"] = true,
    ["markdown"] = false,
}
