return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED: initialize Harpoon
        harpoon:setup()

        -- Example keymaps
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "[A]dd file" })
        vim.keymap.set("n", "<leader>l", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "[L]ist files" })

        -- Navigate between files
        -- vim.keymap.set("n", "<leader>1", function()
        -- 	harpoon:list():select(1)
        -- end)
        -- vim.keymap.set("n", "<leader>2", function()
        -- 	harpoon:list():select(2)
        -- end)
        -- vim.keymap.set("n", "<leader>3", function()
        -- 	harpoon:list():select(3)
        -- end)
        -- vim.keymap.set("n", "<leader>4", function()
        -- 	harpoon:list():select(4)
        -- end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():next()
        end)
    end,
}
