-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use({ '/root/.config/nvim/lua/snoupix/tokyonight_snoupix.lua', as = 'tokyonight_snoupix' })

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use({ 'folke/tokyonight.nvim', as = 'tokyonight', priority = 1000, opts = {} })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                  pcall(vim.cmd, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }

  use "terrortylor/nvim-comment"

  use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
          require("colorizer").setup()
      end,
  }

  use "github/copilot.vim"
end)
