local treesitter = require("nvim-treesitter")

local filetypes = {
    "go", "gomod", "gosum", "rust", "lua", "nix", "sql", "nginx", "proto",
    "java", "kotlin", "groovy",
    "html", "css", "javascript", "typescript",
    "gitcommit", "gitrebase", "gitignore", "diff",
    "python", "sh", "bash",
    "dockerfile",
    "markdown", "markdown_inline",
    "xml", "yaml", "toml",
    "json", "csv", "tsv",
    "vim", "vimdoc",
    "template",
}

treesitter.install(filetypes)

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
})
