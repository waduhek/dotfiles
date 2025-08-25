return require("lazy").setup({
    -- Dev icons
    "nvim-tree/nvim-web-devicons",

    -- Tree-sitter for parsing language and providing syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end
    },

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
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- HACK: This is done to prevent the breaking changes from
        -- nvim-treesitter from causing errors in the preview. Remove this when
        -- telescope supports the re-written version of nvim-treesitter.
        config = function()
            require("telescope").setup({
                defaults = {
                    preview = {
                        treesitter = false,
                    },
                },
            })
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

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            require("telescope").load_extension("harpoon")
            require("harpoon"):setup()
        end
    },

    {
        "j-hui/fidget.nvim",
        config = function ()
            require("fidget").setup()
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require("ibl").setup({ scope = { enabled = false } })
        end
    },
})
