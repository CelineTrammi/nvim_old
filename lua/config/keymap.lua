local keymap = vim.keymap

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" }) -- What does this even do

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>s", "<cmd>source $HOME/.config/nvim/init.lua<CR>")

-- GENERAL SETTINGS

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<C-s>", "<cmd> w <CR>") -- CTRL s for saving
keymap.set("n", "<ESC>", "<cmd> noh <CR>") -- ESC to remove highlightning
keymap.set("n", "n", "nzz") -- Center search after each n

-- Window
keymap.set("n", "<leader>h", "<C-w>v", { desc = "Split window [H]orisontally" }) -- Open window horisontally
keymap.set("n", "<leader>v", "<C-w>s", { desc = "Split window [V]ertically" }) -- Open window vertically
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force [Q]uit" })
keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "E[X]it" })
keymap.set("n", "<leader>xa", "<cmd>xall<CR>", { desc = "E[X]it [A]ll" })
keymap.set("n", "<leader>qa", "<cmd>qall<CR>", { desc = "[Q]uit [A]ll" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Colemak support
keymap.set("n", "<M-Left>", "<C-w>h")
keymap.set("n", "<M-Down>", "<C-w>j")
keymap.set("n", "<M-Up>", "<C-w>k")
keymap.set("n", "<M-Right>", "<C-w>l")

-- EDITING
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- Substitutions for 0/^/$/g_
keymap.set({ "n", "o", "x" }, "<S-h>", "^")
keymap.set({ "n", "o", "x" }, "<S-l>", "g_")
keymap.set({ "n", "o", "x" }, "<S-Left>", "^")
keymap.set({ "n", "o", "x" }, "<S-Right>", "g_")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
