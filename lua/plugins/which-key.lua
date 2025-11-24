-- Hints and such
return {
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
        icons = {
            mappings = vim.g.have_nerd_font,
            keys = vim.g.have_nerd_font and {},
        },
        spec = {
            -- TODO:  Configure
            -- { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
            -- { "<leader>d", group = "[D]ocument" },
            { "<leader>s",  group = "[S]earch" },
            { "<leader>sg", group = "[Git]" },
            { "<leader>t",  group = "[T]oggle" },
            { "l",          group = "[L]SP" },
        },
    },
}
