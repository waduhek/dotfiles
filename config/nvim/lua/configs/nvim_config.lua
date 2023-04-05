-- Completion config.
vim.o.completeopt = "menu,menuone,noselect"

-- Enable ftplugin
vim.api.nvim_command("filetype plugin indent on")

-- Use Carbonfox theme
vim.cmd("colorscheme carbonfox")

-- Show a vertical line after 80 characters
vim.opt.colorcolumn = "80"

-- Enable line numbers
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Show gutter
vim.opt.signcolumn = "yes"

-- Highlight current line
vim.opt.cursorline = true

-- Enable 24-bit colours
vim.opt.termguicolors = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Always show the tabline
vim.opt.showtabline = 2
