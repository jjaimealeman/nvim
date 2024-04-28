vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and navigation
opt.tabstop = 2 -- spaces for tabs (prettier default)
opt.shiftwidth = 2 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line

opt.wrap = false -- disable line wrapping
opt.smartcase = true -- disable case-sensetive search

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so text doesn't shift

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position.

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal widow to the bottom


