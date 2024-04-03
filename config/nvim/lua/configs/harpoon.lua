local harpoon = require("harpoon")
local action_state = require("telescope.actions.state")
local action = require("telescope.actions")

local M = {}

harpoon:setup()

local conf = require("telescope.config").values
function M.toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            map(
                "n",
                "dd",
                function()
                    local selection = action_state.get_selected_entry()
                    harpoon_files:remove_at(selection.index)

                    action.close(prompt_bufnr)
                end
            )

            return true
        end
    }):find()
end

return M
