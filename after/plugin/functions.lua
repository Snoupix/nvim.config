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
            -- dark_purple = '#ffffff',
            
            black = '#0e1013',
            bg0 = '#1f2329',
            bg1 = '#282c34',
            bg2 = '#30363f',
            bg3 = '#323641',
            bg_d = '#181b20',
            bg_blue = '#61afef',
            bg_yellow = '#e8c88c',
            fg = '#a0a8b7',
            purple = '#bf68d9', -- errors & keywords
            green = '#2dd8d3',
            orange = '#7c54ea', -- GLOBALS & some Types
            blue = '#4fa6ed',
            yellow = '#308e99', -- imports
            cyan = '#3dce81', -- properties & macros 
            red = '#e53241', -- error messages on popups & parameters
            grey = '#535965',
            light_grey = '#7a818e',
            dark_cyan = '#266269',
            dark_red = '#ad1b31', -- inline error messages
            dark_yellow = '#835d1a',
            dark_purple = '#7e3992', -- hint tips
            diff_add = '#272e23',
            diff_delete = '#2d2223',
            diff_change = '#172a3a',
            diff_text = '#274964',
        },               -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker = true,     -- darker colors for diagnostic
            undercurl = true,   -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
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
    RefreshLuaLine(theme)
end

FixMeDaddy()
