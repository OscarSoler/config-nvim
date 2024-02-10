-- vim.keymap.set mode, shortcut, action, config
local opts = { noremap = true, silent = true }

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

-- sursor line
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

-- KEY tAPS
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("n", "<leader>V", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", opts)

-- Move lines
-- Normal mode mappings
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { silent = true })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { silent = true })

-- Insert mode mappings
vim.keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { silent = true })
vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { silent = true })

-- Visual mode mappings
vim.keymap.set('v', '<C-j>', ':m \'>+1<CR>gv=gv', { silent = true })
vim.keymap.set('v', '<C-k>', ':m \'<-2<CR>gv=gv', { silent = true })

vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { silent = true })

vim.keymap.set('n', '<C-p>', ':bp<CR>')

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"


-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>", opts)

