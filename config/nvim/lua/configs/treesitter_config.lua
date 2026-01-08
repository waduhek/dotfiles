local treesitter = require("nvim-treesitter")

local filetypes = {
    "go", "gomod", "gosum", "gowork", "rust", "lua", "nix", "sql", "nginx", "proto",
    "java", "kotlin", "groovy",
    "html", "css", "javascript", "typescript",
    "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes", "diff",
    "python", "bash",
    "dockerfile",
    "markdown", "markdown_inline",
    "xml", "yaml", "toml",
    "json", "csv", "tsv",
    "vim", "vimdoc",
    "tmux",
    "make", "cmake",
}

treesitter.install(filetypes)

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldmethod = "expr"
        vim.opt.foldlevel = 99
    end
})
