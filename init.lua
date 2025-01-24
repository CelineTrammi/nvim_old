vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("config.options")
require("config.keymap")

-- theme
-- spec("plugins.themes.catppuccin")

-- show keys with description
-- spec("plugins.which-key")

-- telescope, fuzzy find, etc.
-- spec("plugins.telescope")

-- language server protocol (lsp)
-- spec("plugins.lspconfig")

-- formatter
-- spec("plugins.conform")

-- autocompletion
-- spec("plugins.cmp")

-- comments
-- spec("plugins.comment")

-- indent guides
-- spec("plugins.indent_line")

-- linting
-- spec("plugins.lint")

-- automatically pair brackets together
-- spec("plugins.autopairs")

-- mini files, mini ai, mini surround
-- spec("plugins.mini")

-- trees, file managers and such
-- spec("plugins.oil")

-- git hunks for staging and previewing
-- spec("plugins.lazygit")

-- debugging i guess
-- spec("plugins.debug")

require("config.lazy-bootstrap")
