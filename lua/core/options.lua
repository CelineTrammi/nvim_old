local opt = vim.opt

--tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

--search settings
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append("-")

-- appearance
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.showmode = false -- Don't show mode, since it is already in the status line

-- line numbers
opt.relativenumber = true
opt.number = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true
