return {
	-- starter
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.starter").setup()
		end,
	},
	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},
	-- Oil, navigation
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
	},
	-- Which key
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]oggle" },
				-- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
				{ "<leader>g", group = "Git", mode = { "n", "v" } },
			})
		end,
	},
}
