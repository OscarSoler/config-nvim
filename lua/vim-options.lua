vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true

-- Tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line wrapping
vim.opt.wrap = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor line
-- vim.opt.cursorline = false

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'no'

-- Backspace
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Clipboard
vim.opt.clipboard:append('unnamedplus')

-- Splits windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.iskeyword:append('-')

-- KEY MAPS
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("n", "<leader>V", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", opts)
