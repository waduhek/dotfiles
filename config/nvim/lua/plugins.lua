-- Autocommand to automatically run `PackerCompile` when this file changes.
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup(function(use)
    -- Manage packer itself
    use "wbthomason/packer.nvim"

    -- Dev icons
    use "nvim-tree/nvim-web-devicons"

    -- NvimTree file explorer
    use "nvim-tree/nvim-tree.lua"

    -- Tree-sitter for parsing language and providing syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end
    }

    use "nvim-treesitter/nvim-treesitter-context"

    -- LSP configuration
    use "neovim/nvim-lspconfig"

    -- Autocompletion plugin
    use "hrsh7th/nvim-cmp"

    -- LSP source for nvim-cmp
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets source for nvim-cmp
    use "saadparwaiz1/cmp_luasnip"

    -- Snippets plugin
    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip").setup({
                region_check_events = "CursorHold,InsertLeave,InsertEnter",
                delete_check_events = "TextChanged,InsertEnter",
            })
        end
    }

    -- Rose-pine colorscheme
    use {
        "rose-pine/neovim",
        as = "rose-pine",
    }

    -- Tabby tabline
    use {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby").setup()
            require("tabby.tabline").use_preset("tab_only")
        end
    }

    -- Git provider
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }

    -- Picker for finding files, text, etc.
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" }
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }

    -- Error viewer
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    }

    use "tpope/vim-surround"

    use "tpope/vim-fugitive"
end)
