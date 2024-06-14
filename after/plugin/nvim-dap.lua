local dap, dapui = require("dap"), require("dapui")

---@param args string
local function get_args(args)
    local a = {}
    for arg in string.gmatch(args, "%a*") do
        if arg ~= "" then
            table.insert(a, arg)
        end
    end
    return a
end

dap.set_log_level("TRACE")

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- command = vim.system({ "which", "codelldb" }):wait().stdout, -- probably because of the newline but doesn't work
        command = "codelldb",
        args = { "--port", "${port}" }
    }
}
dap.adapters.lldb = {
    type = 'executable',
    -- command = vim.system({ "which", "lldb-vscode" }):wait().stdout
    command = "lldb-vscode",
}
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}
dap.adapters.rustgdb = {
    type = "executable",
    command = "rust-gdb",
}

dap.configurations.rust = {
    {
        name = "Launch rust-gdb",
        type = "rustgdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            return get_args(vim.fn.input('Args for the executable: '))
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Launch gdb",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            return get_args(vim.fn.input('Args for the executable: '))
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Launch lldb-vscode",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        args = function()
            return get_args(vim.fn.input('Args for the executable: '))
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = false,
    },
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
        args = function()
            return get_args(vim.fn.input('Args for the executable: '))
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = false,
        -- initCommands = function()
        --     -- Find out where to look for the pretty printer Python module
        --     local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
        --
        --     local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
        --     local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
        --
        --     local commands = {}
        --     local file = io.open(commands_file, 'r')
        --     if file then
        --         for line in file:lines() do
        --             table.insert(commands, line)
        --         end
        --         file:close()
        --     end
        --     table.insert(commands, 1, script_import)
        --
        --     return commands
        -- end,
    }
}

dap.configurations.env = function()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
end

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
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
