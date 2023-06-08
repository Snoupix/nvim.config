local ChangeColorScheme = function(color)
    color = color or "tokyonight-night" --"rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "Float", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
end

local ExecuteVimCmds = function()
    vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
    vim.cmd [[highlight SignColumn guibg=NONE]]
    vim.cmd [[set autoread]]
end

function FixMeDaddy()
    ChangeColorScheme()
    ExecuteVimCmds()
end

FixMeDaddy()
