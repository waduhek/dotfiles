local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

---`NvimTree` on attach function. Sets up any keymaps when `nvim-tree` is
---attached to the current buffer.
local function nvim_tree_on_attach(buffnr)
    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = buffnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- Set default mappings
    nvim_tree_api.config.mappings.default_on_attach(buffnr)

    -- Remove the <C-e> keymap as it prevents scrolling in the view.
    vim.keymap.del("n", "<C-e>", { buffer = buffnr })
end

nvim_tree.setup({
    git = {
        ignore = false,
    },
    on_attach = nvim_tree_on_attach,
})

---Opens `NvimTree` if the `nvim` is opened from a directory.
---Refer: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
---@param data any
local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

-- Open NvimTree after all plugins have started
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
