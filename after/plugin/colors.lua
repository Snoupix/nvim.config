function ColorMyPencils(color)
    color = color or "tokyonight-night" --"rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "Float", { bg = "none" })
end

ColorMyPencils()
