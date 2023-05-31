local colors = {
    -- blue   = '#7aa2f7',
    -- cyan   = '#7dcfff',
    -- black  = '#414868',
    -- white  = '#c0caf5',
    -- red    = '#f7768e',
    grey         = '#9aa5ce',
    red          = "#f7768e",
    orange       = "#ff9e64",
    yellow       = "#e0af68",
    light_green  = "#9ece6a",
    green        = "#73daca",
    turquoise    = "#89ddff",
    light_cyan   = "#b4f9f8",
    teal         = "#2ac3de",
    cyan         = "#7dcfff",
    blue         = "#7aa2f7",
    purple       = "#6530c9",
    magenta      = "#bb9af7",
    white        = "#c0caf5",
    light_gray   = "#9aa5ce",
    parameters   = "#cfc9c2",
    comment      = "#565f89",
    black        = "#414868",
    fg           = "#a9b1d6",
    fg_highlight = "#c0caf5",
    fg_gutter    = "#363b54",
    bg           = "#1a1b26",
    bg_highlight = "#30374b",
    bg_menu      = "#16161e",
}

local CheckGitWorkspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local GetFileName = function()
    local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:~:h')
    local path_arr = vim.fn.split(path, '/')
    local result = ''
    for _, str in ipairs(path_arr) do
        if str:sub(1, 1) == '.' then
            result = result .. str:sub(1, 2) .. '/'
            goto continue
        end

        result = result .. str:sub(1, 1) .. '/'
        ::continue::
    end
    return result .. vim.fn.expand('%:t')
end

local GetLSPs = function()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
        return msg
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            if msg == '' then
                msg = client.name:gsub("^%l", string.upper)

                goto continue
            end

            msg = msg .. " - " .. client.name:gsub("^%l", string.upper)
        end
        ::continue::
    end

    return msg
end

local GetCopilotStatus = function()
    return vim.api.nvim_command_output("Copilot status")
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = { fg = colors.fg_highlight, bg = colors.purple, gui = 'bold' },
                b = { fg = colors.bg, bg = colors.fg },
                c = { fg = colors.white, bg = colors.bg_menu },
                x = { fg = colors.white, bg = colors.bg_menu },
                y = { fg = colors.bg, bg = colors.fg },
                z = { fg = colors.fg_highlight, bg = colors.purple, gui = 'bold' },
            },

            insert = { a = { fg = colors.black, bg = colors.light_green } },
            visual = { a = { fg = colors.black, bg = colors.yellow } },
            replace = { a = { fg = colors.black, bg = colors.red } },
            command = { a = { fg = colors.black, bg = colors.teal } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white, bg = colors.black },
                x = { fg = colors.white, bg = colors.black },
                y = { fg = colors.white, bg = colors.black },
                z = { fg = colors.white, bg = colors.black },
            },
        },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { right = '', left = '' }, right_padding = 2 }
        },
        lualine_b = {
            { 'branch', cond = CheckGitWorkspace },
            { 'diff',   cond = CheckGitWorkspace },
        },
        lualine_c = { GetLSPs, { '%=', separator = { right = '' } }, GetFileName },
        lualine_x = { GetCopilotStatus },
        lualine_y = {
            { 'diagnostics', --[[separator = { left = '' }]] },
            { 'searchcount', --[[separator = { left = '' }]] },
            { 'selectioncount', --[[separator = { left = '' }]] },
            { 'encoding', --[[separator = { left = '' }]] },
            { 'fileformat', --[[separator = { left = '' }]] },
            { 'progress', --[[separator = { left = '' }]] },
            { 'location', --[[separator = { left = '' }]] },
        },
        lualine_z = { { 'filetype', separator = { right = '', left = '' } } }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
