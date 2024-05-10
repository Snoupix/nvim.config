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
        config = function()
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
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            require('sg').setup()
        end
    },

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

    {
        'giusgad/pets.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'giusgad/hologram.nvim' },
        enabled = false,
        config = function()
            require("pets").setup({
                row = 1,                        -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
                col = 0,                        -- the column to display the pet at (set to high number to have it stay still on the right side)
                speed_multiplier = 1,           -- you can make your pet move faster/slower. If slower the animation will have lower fps.
                default_pet = "dog",            -- the pet to use for the PetNew command
                default_style = "brown",        -- the style of the pet to use for the PetNew command
                random = true,                  -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
                death_animation = true,         -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
                popup = {                       -- popup options, try changing these if you see a rectangle around the pets
                    width = "30%",              -- can be a string with percentage like "45%" or a number of columns like 45
                    winblend = 100,             -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
                    hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
                    avoid_statusline = false,   -- if winblend is 100 then the popup is invisible and covers the statusline, if that
                    -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
                }
            })
        end
    },

    {
        'tamton-aquib/duck.nvim',
        enabled = false,
        config = function()
            require("duck").hatch("🐈")
        end
    },

    'imsnif/kdl.vim',

    'psliwka/vim-smoothie',
}
