vim.cmd("let g:netrw_liststyle = 3")

vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and navigation
vim.opt.tabstop = 2 -- spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line

vim.opt.wrap = false -- disable line wrapping
vim.opt.smartcase = true -- disable case-sensetive search

vim.opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes" -- show sign column so text doesn't shift

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position.

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal widow to the bottom

vim.opt.undodir = vim.fn.expand("~/.config/Lazy-nvim/undodir")
vim.opt.undofile = true
vim.opt.undolevels = 10000
