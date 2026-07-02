vim.lsp.enable("clangd")
-- vim.lsp.enable("lua_ls")

-- Change diagnostic symbols in the sign column (gutter)
if vim.g.have_nerd_font then
    local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
    local diagnostic_signs = {}
    for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
    end
    vim.diagnostic.config { signs = { text = diagnostic_signs } }
end

-- formatting
vim.g.autoFormat = false;
function ToggleFormatOnSave()
    vim.g.autoFormat = not vim.g.autoFormat
    print("Format on save: " .. (vim.g.autoFormat and "enable" or "disabled"))
end

vim.api.nvim_create_user_command("ToggleFormat", ToggleFormatOnSave, {})
vim.keymap.set('n', '<leader>tf', ToggleFormatOnSave, { desc = "format on save"})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp', {}),
    callback = function(args)
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        -- if client:supports_method('textDocument/completion') then
        --     -- Optional: trigger autocompletion on EVERY keypress. May be slow!
        --     local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        --     client.server_capabilities.completionProvider.triggerCharacters = chars
        --     -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        -- end


        -- KEYMAPS
        vim.keymap.set('n', 'grh', '<cmd>LspClangdSwitchSourceHeader<CR>')
        vim.keymap.set('n', '<leader>ld', vim.lsp.tagfunc, {desc="tagfunc"})
        vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, {desc = "code action"})
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = "implementation" })
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, { desc = "re[n]ame" })
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { desc = "[r]eferences" })
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = "[t]ype" })
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol, { desc = "[s]ymbol" })
        vim.keymap.set('n', '<leader>lh', vim.lsp.buf.document_highlight, { desc = "[h]ighligth" })

        -- FORMAT
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    if vim.g.autoFormat then
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                    end
                end,
            })
        end
    end
})
