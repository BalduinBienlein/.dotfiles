vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-commentary')
    use('ap/vim-css-color')
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
