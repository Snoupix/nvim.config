local lsp = require('lsp-zero').preset({})

-- lsp.setup_servers({ 'dartls', force = true }) -- needed to use dartls from exec
lsp.ensure_installed({
    -- 'sumneko_lua',
    -- 'dartls',
    --'rust-analyzer',
    'gopls',
    'denols',
    'pyright',
    'tailwindcss',
    'bashls',
    'clangd',
    'cssls',
    'eslint',
    'lua_ls',
    'sqlls',
    'volar',
    'svelte',
    'ts_ls',
    'yamlls'
})

local cmp = require('cmp')
cmp.setup({ mapping = {} })
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    --lsp.default_keymaps({buffer = bufnr})
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ss", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<C-d>", vim.diagnostic.goto_next, opts)
    --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        -- ['rust_analyzer'] = { 'rust' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})

-- Go fmt on save
vim.cmd [[autocmd BufWritePost *.go silent !gofmt -w %]]

local lspconfig = require('lspconfig')

lspconfig.denols.setup({
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig.ts_ls.setup({
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "/home/snoupix/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.jsx",
        "vue",
    },
    -- single_file_support = false,
})

lspconfig.volar.setup({
    on_attach = lsp.on_attach,
    filetypes = { 'typescript', 'javascript', 'vue', 'json' },
    init_options = {
        typescript = {
            tsdk =
            '/home/snoupix/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib'
        }
    }
})

-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- lspconfig.rust_analyzer.setup({
--     root_dir = lspconfig.util.root_pattern("Cargo.toml") or lspconfig.util.root_pattern("rust-project.json"),
--     settings = {
--         ["rust-analyzer"] = {
--             checkOnSave = {
--                 command = "clippy",
--             },
--             files = {
--                 cargoFmt = {
--                     enable = true,
--                 },
--             },
--         }
--     },
-- })

lspconfig.hls.setup({
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    root_dir = lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
    settings = {
        haskell = {
            checkOnSave = {
                command = "hlint",
            },
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "ormolu"
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        spacing = 2,
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
