local harpoon = require("harpoon")

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
