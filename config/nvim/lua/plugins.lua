return require("lazy").setup({
    -- Dev icons
    "nvim-tree/nvim-web-devicons",

    -- NvimTree file explorer
    "nvim-tree/nvim-tree.lua",

    -- Tree-sitter for parsing language and providing syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end
    },

    "nvim-treesitter/nvim-treesitter-context",

    -- LSP configuration
    "neovim/nvim-lspconfig",

    -- Autocompletion plugin
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- LSP source for nvim-cmp
            "hrsh7th/cmp-nvim-lsp",

            "hrsh7th/cmp-buffer",

            -- Snippets source for nvim-cmp
            "saadparwaiz1/cmp_luasnip",

            -- Snippets plugin
            "L3MON4D3/LuaSnip",
        },
    },

    -- Catppuccin theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                no_italic = true,
                integrations = {
                    lsp_trouble = true,
                    treesitter_context = true,
                },
            })
        end
    },

    -- Tabby tabline
    {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby").setup()
            require("tabby.tabline").use_preset("tab_only")
        end
    },

    -- Git provider
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    -- Picker for finding files, text, etc.
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },

    -- Error viewer
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    },

    "tpope/vim-surround",

    "tpope/vim-fugitive",
})
