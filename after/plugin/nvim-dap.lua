local dap, dapui = require("dap"), require("dapui")
-- local mason_registery = require("mason-registry")
--
-- local codelldb = mason_registery.get_package("codelldb")
-- local extension_path = codelldb:get_install_path() .. "/extension/"
local extension_path = vim.env.HOME .. '/.vscode-server/extensions/vadimcn.vscode-lldb-1.10.0/'
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. 'lldb/lib/liblldb'

local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

-- dap.adapters.lldb = {
--     type = 'executable',
--     command = '/usr/bin/lldb',
--     name = 'lldb'
-- }

dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
dap.adapters.lldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)

dap.configurations.rust = {
    {
        name = "Launch codelldb",
        type = "codelldb",  -- matches the adapter
        request = "launch", -- could also attach to a currently running process
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
        initCommands = function()
            -- Find out where to look for the pretty printer Python module
            local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

            local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
            local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

            local commands = {}
            local file = io.open(commands_file, 'r')
            if file then
                for line in file:lines() do
                    table.insert(commands, line)
                end
                file:close()
            end
            table.insert(commands, 1, script_import)

            return commands
        end,
    }
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dx', '<cmd>lua require"dap".terminate()<CR>', { noremap = true, silent = true })
