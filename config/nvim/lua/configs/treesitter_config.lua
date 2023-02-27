require("nvim-treesitter.configs").setup {
    -- Ensure all parsers are available
    ensure_install = { "all" },

    -- Install parsers synchronously
    sync_install = true,

    -- Automatically install parsers
    auto_install = true,

    highlight = {
        -- Enable highlighting
        enable = true,
    },

    incremental_selection = {
        -- Enable incremental selection and set some maps
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
