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
    "hrsh7th/nvim-cmp",

    -- LSP source for nvim-cmp
    "hrsh7th/cmp-nvim-lsp",

    -- Snippets source for nvim-cmp
    "saadparwaiz1/cmp_luasnip",

    -- Snippets plugin
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip").setup({
                region_check_events = "CursorHold,InsertLeave,InsertEnter",
                delete_check_events = "TextChanged,InsertEnter",
            })
        end
    },

    -- Rose-pine colorscheme
    {
        "rose-pine/neovim",
        as = "rose-pine",
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
        tag = "0.1.2",
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
