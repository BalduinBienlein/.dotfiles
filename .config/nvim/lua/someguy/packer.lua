vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('chomosuke/typst-preview.nvim')
    use('mbbill/undotree')
    use('tpope/vim-commentary')
    use('ap/vim-css-color')
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
    use ({
        'ptdewey/darkearth-nvim',
        as = 'darkearth',
    })

    use ({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
        }
    })
    use ({
        "mfussenegger/nvim-dap",
        requires = {
            {"rcarriga/nvim-dap-ui"},
            {"nvim-neotest/nvim-nio"},
            {"jay-babu/mason-nvim-dap.nvim"},
            {"theHamsta/nvim-dap-virtual-text"},
        }
    })
end)
