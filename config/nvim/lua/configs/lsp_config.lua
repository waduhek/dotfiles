local lspconfig = require("lspconfig")

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_set_option_value(
        "omnifunc",
        "v:lua.vim.lsp.omnifunc",
        { buf = bufnr }
    )

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set(
        "n",
        "<space>f",
        function()
            vim.lsp.buf.format { async = true }
        end,
        bufopts
    )
end

-- Add required servers here.
local servers = require("constants.lsp_servers").get_lsp_servers()
for _, lsp in ipairs(servers) do
    local lsp_name = lsp.name
    local lsp_settings = lsp.settings

    if lsp_settings ~= nil then
        lspconfig[lsp_name].setup {
            on_attach = on_attach,
            settings = lsp_settings,
        }
    else
        lspconfig[lsp_name].setup {
            on_attach = on_attach,
        }
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        -- Enable autocompletion and trigger it on each keypress.
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/completion") then
            client.server_capabilities.completionProvider.triggerCharacters =
                vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")

            vim.lsp.completion.enable(
                true,
                client.id,
                args.buf,
                { autotrigger = true }
            )
        end

        -- vim.api.nvim_create_autocmd("TextChangedI", {
        --     buffer = args.buf,
        --     callback = function ()
        --         vim.lsp.completion.get()
        --     end
        -- })

        -- Show documentation for the currently selected item.
        local _, cancel_prev = nil, function () end

        vim.api.nvim_create_autocmd("CompleteChanged", {
            buffer = args.buf,
            callback = function ()
                cancel_prev()

                local info = vim.fn.complete_info({ "selected" })

                local completion_item = vim.tbl_get(
                    vim.v.completed_item,
                    "user_data",
                    "nvim",
                    "lsp",
                    "completion_item"
                )
                if completion_item == nil then
                    return
                end

                _, cancel_prev = vim.lsp.buf_request(
                    args.buf,
                    vim.lsp.protocol.Methods.completionItem_resolve,
                    completion_item,
                    function (err, item, ctx)
                        if not item then
                            return
                        end

                        local docs = (item.documentation or {}).value
                        local win = vim.api.nvim__complete_set(info.selected, { info = docs })

                        if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                            vim.treesitter.start(win.bufnr, "markdown")
                            vim.wo[win.winid].conceallevel = 3
                        end
                    end
                )
            end
        })
    end
})

-- Show diagnostic information on the current line.
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
