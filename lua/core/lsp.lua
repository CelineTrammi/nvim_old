vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")

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
vim.g.autoFormat = true;
function ToggleFormatOnSave()
    vim.g.autoFormat = not vim.g.autoFormat
    print("Format on save: " .. (vim.g.autoFormat and "enable" or "disabled"))
end

vim.api.nvim_create_user_command("ToggleFormat", ToggleFormatOnSave, {})
vim.keymap.set('n', '<leader>tf', ToggleFormatOnSave)

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
        vim.keymap.set('n', 'ld', vim.lsp.tagfunc)
        vim.keymap.set('n', 'lca', vim.lsp.buf.code_action)
        vim.keymap.set('n', 'li', vim.lsp.buf.implementation, { desc = "implementation" })
        vim.keymap.set('n', 'ln', vim.lsp.buf.rename)
        vim.keymap.set('n', 'lr', vim.lsp.buf.references)
        vim.keymap.set('n', 'lt', vim.lsp.buf.type_definition)
        vim.keymap.set('n', 'ls', vim.lsp.buf.document_symbol)
        vim.keymap.set('n', 'lh', vim.lsp.buf.document_highlight)

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
