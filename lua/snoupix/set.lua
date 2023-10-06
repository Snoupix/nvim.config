vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.smoothie_no_default_mappings = false

local separator = package.config:sub(1, 1)
if separator == '/' then
    local uname = io.popen("uname -s"):read("*l")
    if uname == "Linux" then
        vim.g.rust_clip_command = 'xclip -selection clipboard'
    elseif uname == "Darwin" then
        vim.g.rust_clip_command = 'pbcopy'
    end
elseif separator == '\\' then
    vim.g.rust_clip_command = 'clip'
end

vim.g.rustfmt_autosave = 1

vim.g.gitblame_enabled = 1
-- <author>, <committer>, <date>, <committer-date>, <summary>, <sha>
vim.g.gitblame_message_template = '<summary> • <date> • <author>'
-- %r  relative date (e.g., 3 days ago)
-- %a  abbreviated weekday name (e.g., Wed)
-- %A  full weekday name (e.g., Wednesday)
-- %b  abbreviated month name (e.g., Sep)
-- %B  full month name (e.g., September)
-- %c  date and time (e.g., 09/16/98 23:48:10)
-- %d  day of the month (16) [01-31]
-- %H  hour, using a 24-hour clock (23) [00-23]
-- %I  hour, using a 12-hour clock (11) [01-12]
-- %M  minute (48) [00-59]
-- %m  month (09) [01-12]
-- %p  either "am" or "pm" (pm)
-- %S  second (10) [00-61]
-- %w  weekday (3) [0-6 = Sunday-Saturday]
-- %x  date (e.g., 09/16/98)
-- %X  time (e.g., 23:48:10)
-- %Y  full year (1998)
-- %y  two-digit year (98) [00-99]
-- %%  the character `%´
vim.g.gitblame_date_format = '%r - %c'
