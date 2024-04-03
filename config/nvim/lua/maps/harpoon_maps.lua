local harpoon = require("harpoon")
local harpoon_config = require("configs.harpoon")

-- Open harpoon with telescope
vim.keymap.set(
    "n",
    "<C-q>",
    function()
        harpoon_config.toggle_telescope(harpoon:list())
    end,
    { desc = "Open harpoon window" }
)

-- Harpoon the current file
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        harpoon:list():add()
    end
)

-- Go to next buffer in harpoon list
vim.keymap.set(
    "n",
    "<C-h>",
    function()
        harpoon:list():prev()
    end
)

-- Go the previous buffer in harpoon list
vim.keymap.set(
    "n",
    "<C-l>",
    function()
        harpoon:list():next()
    end
)
