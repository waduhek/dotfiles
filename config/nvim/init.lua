-- Load plugins
require("plugins")
-- Load configs
require("configs")

-- Indentation setting
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0

-- =================== Keymaps ===================
require("maps")
