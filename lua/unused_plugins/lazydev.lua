-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- Makes it so I don't get a ton of lua lsp warnings in my configs
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
