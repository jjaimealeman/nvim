vim.g.mapleader = " "

local keymap = vim.keymap

-- SHIFT KEYS
keymap.set("n", "<S-Down>", ":m .+1<cr>") -- move line down
keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv") -- move selection down
keymap.set("n", "<S-Up>", ":m .-2<cr>") -- move line up
keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv") -- move selection up
keymap.set("n", "<S-Right>", ">>") -- indent line
keymap.set("v", "<S-Right>", ">gv", { silent = true, noremap = true }) -- indent block
keymap.set("n", "<S-Left>", "<<") -- deindent line
keymap.set("v", "<S-Left>", "<gv", { silent = true, noremap = true }) -- deindent block

-- CONTROL/CTRL KEYS
keymap.set("n", "<C-s>", ":w<CR>") -- SAVE WITH CTRL S
keymap.set("i", "<C-s>", "<ESC>:w<CR>")
keymap.set(
  "n",
  "<C-x>",
  [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor, non-interactive." }
)
keymap.set(
  "n",
  "<C-s-x>",
  [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]],
  { desc = "Replace word under cursor, interactive." }
)
keymap.set("n", "<C-h>", "<C-w>h") -- better window navigation
keymap.set("n", "<C-j>", "<C-w>j") --
keymap.set("n", "<C-k>", "<C-w>k") --
keymap.set("n", "<C-l>", "<C-w>l") --
keymap.set("n", "<C-Up>", ":resize -2<CR>") -- resize window with arrows
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
keymap.set("n", "<C-Z>", "u") -- undo
keymap.set("n", "<C-Y>", "<C-R>") -- redo
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<C-c>", ":let @+ = expand('%:p')<CR>", { desc = "copy path of current buffer/file to clipboard." })

-- -- RANDOM KEYS
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj." })
keymap.set("n", "<ESC><ESC>", ":noh<CR>", { desc = "Clear search highlights." }) -- clear highlights
keymap.set("n", "+", "<C-a>", { desc = "Increment number." }) -- INCREMENT NUMBERS
keymap.set("n", "-", "<C-x>", { desc = "Decrement number." }) -- DECREMENT NUMBERS
keymap.set("n", "n", "nzzzv") -- keep highlighted search term in the center of page
keymap.set("n", "N", "Nzzzv")
--keymap.set("n", "tds", ":pu=strftime('%a %d %b %Y')<CR>", { desc = "Date stamp." }) -- time date stamp = Fri 23 Dec 2022
keymap.set("n", "dts", "a<C-R>=strftime('%a %d %b %Y @ %H:%M')<CR><ESC>", { desc = "Date & time stamp." })
keymap.set("n", "tds", "a<C-R>=strftime('%a %d %b %Y @ %H:%M')<CR><ESC>", { desc = "Date & time stamp." })
keymap.set("n", "ds", "a<C-R>=strftime('%a %d %b %Y')<CR><ESC>", { desc = "Date stamp." })
keymap.set("n", "ts", "a<C-R>=strftime('%H:%M')<CR><ESC>", { desc = "Time stamp." })
keymap.set("n", "y", '"+y')
keymap.set("v", "y", '"+y')
keymap.set("n", "y", '"+Y')
keymap.set("n", "yw", "bvey") -- SELECT AND COPY THIS WORD
--
-- WINDOW MANAGEMENT
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab." })
--keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab." })
--keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab." })
keymap.set("n", "<s-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab." })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })

keymap.set("n", "<C-Z>", "u") -- undo
keymap.set("n", "<C-Y>", "<C-R>") -- redo

-- NOTES:
-- SUPER FIND & REPLACE by Primeagen https://youtu.be/w7i4amO_zaE?t=1724
-- copy the buffer to the system clipboard for use elsewhere https://youtu.be/w7i4amO_zaE?t=1633
