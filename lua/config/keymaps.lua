-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- SUPER FIND & REPLACE by Primeagen https://youtu.be/w7i4amO_zaE?t=1724
vim.keymap.set("n", "<C-x>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace word under cursor
--
vim.keymap.set("n", "*", "*<C-o>", { noremap = true }) -- so the cursor doesnt move on selection
vim.keymap.set("i", "kj", "<Esc>", { noremap = true }) -- kj to escape
vim.keymap.set("n", "<C-u>", ":UndotreeToggle<CR>", { silent = true }) -- toggle UndoTree
vim.keymap.set("n", "<C-f>", ":Neotree toggle<CR>") -- toggle Neotree
--
-- SHIFT KEYS
vim.keymap.set("n", "<S-Down>", ":m .+1<cr>") -- move line down
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv") -- move selection down
vim.keymap.set("n", "<S-Up>", ":m .-2<cr>") -- move line up
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv") -- move selection up
vim.keymap.set("n", "<S-Right>", ">>") -- indent line
vim.keymap.set("v", "<S-Right>", ">gv", { silent = true, noremap = true }) -- indent block
vim.keymap.set("n", "<S-Left>", "<<") -- deindent line
vim.keymap.set("v", "<S-Left>", "<gv", { silent = true, noremap = true }) -- deindent block
--
-- RANDOM KEYS
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>") -- clear highlights
vim.keymap.set("n", "+", "<C-a>") -- increment numbers 123.4
vim.keymap.set("n", "-", "<C-x>") -- decrement numbers 35
vim.keymap.set("n", "n", "nzzzv") -- keep highlighted search term in the center of page
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "sh", ":split<Return><C-w>w") -- split window horizontally
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w") -- split window vertically
vim.keymap.set("n", "tds", ":pu=strftime('%a %d %b %Y')<CR>") -- time date stamp = Fri 23 Dec 2022
vim.keymap.set("n", "y", '"+y') -- copy the buffer to the system clipboard for use elsewhere https://youtu.be/w7i4amO_zaE?t=1633
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "y", '"+Y')
vim.keymap.set("n", "yw", "bvey") -- select and copy this word
--
-- CONTROL/CTRL KEYS
-- vim.keymap.set("n", "<C-t>", ":ToggleTerm size=40 dir=git_dir direction=float<cr>")
-- vim.keymap.set("n", "<C-s>", ":ASToggle<CR>", {})
vim.keymap.set("n", "<C-h>", "<C-w>h") -- better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j") --
vim.keymap.set("n", "<C-k>", "<C-w>k") --
vim.keymap.set("n", "<C-l>", "<C-w>l") --
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>") -- resize window with arrows
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Z>", "u") -- undo
vim.keymap.set("n", "<C-Y>", "<C-R>") -- redo
