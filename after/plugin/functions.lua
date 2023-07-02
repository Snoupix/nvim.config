local ChangeColorScheme = function(color)
    require('onedark').setup {
        style = 'darker',             -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true,           -- Show/hide background
        term_colors = true,           -- Change terminal color as per the selected theme style
        ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
            comments = 'italic',
            keywords = 'italic',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },

        -- Lualine options --
        lualine = {
            transparent = true, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {
            yellow = '#00bca0',
            blue = '#02d17a',
            light_green = '#00ff94',
        },               -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker = false,     -- darker colors for diagnostic
            undercurl = true,   -- use undercurl instead of underline for diagnostics
            background = false, -- use background color for virtual text
        },
    }
    color = color or "tokyonight-night"
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

function FixMeDaddy(theme)
    ChangeColorScheme(theme)
    ExecuteVimCmds()
end

FixMeDaddy()
