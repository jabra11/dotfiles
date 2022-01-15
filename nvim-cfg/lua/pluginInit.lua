return require("packer").startup(
    function()
        use {
            "wbthomason/packer.nvim"
            --event = "VimEnter"
        }

        use {
            "wakatime/vim-wakatime"
        }

        use {
            "tpope/vim-dispatch",
            commit = "c88f1b1e4fd428d826fa38c272ed80b6518d37eb"
        }

        use {
            "akinsho/bufferline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.bufferline"
            end
        }

        use {
            --"glepnir/galaxyline.nvim",
            -- change upstream to maintained fork
            "NTBBloodbath/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.statusline"
            end
        }

        -- color related stuff
        use {
            "jabra98/nvim-base16.lua",
            commit = "91dac294cebd9f4fc9ee162e64d30d0aa4e18d53",
            after = "packer.nvim",
            config = function()
                require "theme"
            end
        }

        -- lsp stuff
        use {
            "nvim-treesitter/nvim-treesitter",
            --event = "BufRead",
            config = function()
                require "plugins.treesitter"
            end
        }

        --use {
        --    "nvim-lua/completion-nvim"
        --}

        use {
            'hrsh7th/cmp-nvim-lsp'
        }

        use {
            'hrsh7th/cmp-buffer'
        }

        use {
            'hrsh7th/cmp-path'
        }

        use {
            'hrsh7th/cmp-cmdline'
        }

        use {
            'hrsh7th/nvim-cmp',
            config = function()
                require "plugins.nvim-cmp"
            end
        }

        --" Plug 'L3MON4D3/LuaSnip'
        --" Plug 'saadparwaiz1/cmp_luasnip'

        use {
            --'hrsh7th/cmp-vsnip'
            'saadparwaiz1/cmp_luasnip'
        }

        use {
            'L3MON4D3/LuaSnip'
            --'hrsh7th/vim-vsnip'
        }

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "plugins.lspconfig"
            end
        }

        use {
            "onsails/lspkind-nvim",
            --event = "BufEnter",
            config = function()
                require("plugins.lspkind")
            end
        }

        ---- file managing , picker etc
        use {
            "kyazdani42/nvim-tree.lua",
            -- freeze for now due to them changing
            -- a lot of internal stuff (date now 2021-11-08)
            --
            -- should probably be put back to fetch upstream in
            -- a few months or so
            commit = "6cadd3a9d7202524648d5fcbf5e6da9ddd32cd19",
            cmd = "NvimTreeToggle",
            config = function()
                require "plugins.nvimtree"
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.icons"
            end
        }

        use {
            "nvim-lua/plenary.nvim",
            after = "popup.nvim"
        }

        use {
            "nvim-lua/popup.nvim"
        }

        use {
            "nvim-telescope/telescope.nvim",
            after = "plenary.nvim",
            cmd = "Telescope",
            config = function()
                require "plugins.telescope"
            end
        }

    end
)

