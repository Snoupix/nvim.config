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

-- local GetRootPath = function()
--     local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:~:h')
--     local path_arr = vim.fn.split(path, '/')
--     local result = ''
--     for _, str in ipairs(path_arr) do
--         if str:sub(1, 2) == '.' then
--             result = result .. str:sub(1, 3) .. '/'
--             goto continue
--         end
--
--         result = result .. str:sub(1, 2) .. '/'
--         ::continue::
--     end
--     return result
-- end

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
                msg = client.name

                goto continue
            end

            msg = msg .. " - " .. client.name
        end
        ::continue::
    end

    return msg
end

-- Fix for multi nvim window openning
-- (when the copilot status is fetched on dap-ui openning, it freezes probably because of the number of windws that executes this command ?)
-- AND when spawning a nvim command with exec2, it awaits the result and blocks the startup time so by doing that with a function, it makes
-- the startup time blazingly fast(er)
local fetch_copilot_status = function()
    local status = vim.api.nvim_exec2("Copilot status", { output = true }).output

    if string.find(status, "g:copilot_filetypes") then
        return "Copilot: Disabled for " .. string.match(status, "filetype=(%a+)")
    end

    if string.find(status, "Disabled globally") then
        return "Copilot: Disabled"
    end

    return status
end
local thread = coroutine.create(fetch_copilot_status)
local enable_auto_reload = false

local copilot_status = ""

-- Global fn to trigger the command manually and avoid blocking the main thread on startup/boot
function LoadCopilotStatus()
    -- early return since the disabling of Copilot

    --[[ if not enable_auto_reload then
        enable_auto_reload = true
    end

    if coroutine.status(thread) ~= "dead" then
        local _, s = coroutine.resume(thread)
        copilot_status = s
        thread = coroutine.create(fetch_copilot_status)
    end ]]
end

local function get_copilot_status()
    if enable_auto_reload then
        LoadCopilotStatus()
    end

    return copilot_status
end

function RefreshLuaLine(theme)
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = theme and theme or {
                normal = {
                    a = { fg = colors.fg_highlight, bg = colors.purple },
                    b = { fg = colors.bg, bg = colors.fg },
                    c = { fg = colors.white, bg = colors.bg_menu },
                    x = { fg = colors.white, bg = colors.bg_menu },
                    y = { fg = colors.bg, bg = colors.fg },
                    z = { fg = colors.fg_highlight, bg = colors.purple },
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
                'fileformat',
                { 'branch', cond = CheckGitWorkspace },
            },
            lualine_c = {
                {
                    'diff',
                    cond = CheckGitWorkspace
                },
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = colors.orange },
                },
                GetLSPs,
                {
                    '%=', separator = { right = '' }
                },
                'filename'
            },
            lualine_x = {
                get_copilot_status,
                {
                    'diagnostics',
                    symbols = { error = '❗️', warn = '🔔 ', info = '🚀 ', hint = '💡' },
                    colored = true,
                }
            },
            lualine_y = {
                { 'searchcount', --[[separator = { left = '' }]] },
                { 'selectioncount', --[[separator = { left = '' }]] },
                { 'encoding', --[[separator = { left = '' }]] },
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
        -- tabline = {
        --     lualine_a = {},
        --     lualine_b = {'branch'},
        --     lualine_c = {'filename'},
        --     lualine_x = {},
        --     lualine_y = {},
        --     lualine_z = {}
        -- },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end

RefreshLuaLine('onedark')
