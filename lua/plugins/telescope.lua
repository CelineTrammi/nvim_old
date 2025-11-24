-- Fuzzy Finder (files, lsp, etc)
-- A lot of capabilities TODO: experiment with where to keep keymaps for different pickers
return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        -- File Pickers
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "file" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[W]ord" })
        vim.keymap.set("n", "<leader>sr", builtin.live_grep, { desc = "[R]ipgrep" })

        -- Git Pickers
        vim.keymap.set("n", "<leader>sgf", builtin.git_files, { desc = "[F]iles" })
        vim.keymap.set("n", "<leader>sgs", builtin.git_stash, { desc = "[S]tashes" })
        vim.keymap.set("n", "<leader>sgc", builtin.git_commits, { desc = "[C]ommits" })
        vim.keymap.set("n", "<leader>sgb", builtin.git_branches, { desc = "[B]ranches" })

        -- Vim Pickers
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })

        -- Neovim Pickers
        vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "[T]elescope" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Find existing buffers" })

        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[N]vim files" })
    end
}
