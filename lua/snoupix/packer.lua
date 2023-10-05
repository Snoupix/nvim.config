vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        }
    }

    -- TODO: try to configure onedark into tokyonight fashion
    use({ 'folke/tokyonight.nvim', as = 'tokyonight', priority = 1000, opts = {} })
    use 'navarasu/onedark.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
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

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'

    use "terrortylor/nvim-comment"

    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("colorizer").setup(nil, {
                RGB      = true,         -- #RGB hex codes
                RRGGBB   = true,         -- #RRGGBB hex codes
                names    = true,         -- "Name" codes like Blue
                RRGGBBAA = true,        -- #RRGGBBAA hex codes
                rgb_fn   = false,        -- CSS rgb() and rgba() functions
                hsl_fn   = false,        -- CSS hsl() and hsla() functions
                css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode     = 'background', -- Set the display mode.
            })
        end,
    }

    use "github/copilot.vim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- use "mg979/vim-visual-multi"

    use "rhysd/conflict-marker.vim"

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use 'm4xshen/autoclose.nvim'
    use 'mbbill/undotree'

    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use 'imsnif/kdl.vim'

    use 'psliwka/vim-smoothie'
end)
