return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        }
    },

    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        priority = 1000,
        opts = {}
    },

    {
        'navarasu/onedark.nvim',
        config = function()
            require("snoupix.statusbar")
        end,
        priority = 1000,
    },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-context',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'mason-org/mason-registry' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    'rust-lang/rust.vim',
    'simrat39/rust-tools.nvim',
    'mfussenegger/nvim-dap',
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" }
    },

    {
        'terrortylor/nvim-comment',
        run = function()
            require('nvim_comment').setup()
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        cmd = 'ColorizerToggle',
        config = function()
            require('colorizer').setup(nil, {
                RGB      = true,         -- #RGB hex codes
                RRGGBB   = true,         -- #RRGGBB hex codes
                names    = true,         -- "Name" codes like Blue
                RRGGBBAA = true,         -- #RRGGBBAA hex codes
                rgb_fn   = false,        -- CSS rgb() and rgba() functions
                hsl_fn   = false,        -- CSS hsl() and hsla() functions
                css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode     = 'background', -- Set the display mode.
            })
        end,
    },

    'github/copilot.vim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    -- 'mg979/vim-visual-multi'

    'rhysd/conflict-marker.vim',

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    'f-person/git-blame.nvim',

    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    },
    'mbbill/undotree',

    {
        'kylechui/nvim-surround',
        version = "*",
        config = function()
            require('nvim-surround').setup({})
        end
    },

    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' },
    },

    'imsnif/kdl.vim',

    'psliwka/vim-smoothie',
}
