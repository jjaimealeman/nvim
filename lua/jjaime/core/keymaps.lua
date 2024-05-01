local keymap = vim.keymap

-- Move Lines
keymap.set("n", "<S-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<S-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- INDENT LINES
keymap.set("n", "<S-Right>", ">>", { desc = "Indent line." }) -- indent line
keymap.set("v", "<S-Right>", ">gv", { desc = "Indent block.", silent = true, noremap = true }) -- indent block
keymap.set("n", "<S-Left>", "<<", { desc = "Deindent line." }) -- deindent line
keymap.set("v", "<S-Left>", "<gv", { desc = "Deindent block.", silent = true, noremap = true }) -- deindent block

-- SEARCH & REPLACE
keymap.set("n", "<C-x>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace w/o confirmation." })
keymap.set("n", "<C-s-x>", [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = "Replace with confirmation." })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true }) -- https://www.lazyvim.org/configuration/general#keymaps
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true }) --
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true }) --
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true }) --

keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" }) -- SAVE WITH CTRL S
-- keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save" })
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

keymap.set("n", "<C-Z>", "u", { desc = "Undo." })
keymap.set("n", "<C-Y>", "<C-R>", { desc = "Redo." })
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all." })

keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
--
-- THE YANKS
keymap.set("n", "<leader>yp", ":let @+ = expand('%:p')<CR>", { desc = "Yank path." })
keymap.set("n", "<leader>yw", "viwy", { desc = "Yank word." })

keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj." })

-- Add undo break-points
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap.set("n", "<ESC><ESC>", ":noh<CR>", { desc = "Clear search highlights." }) -- clear highlights

keymap.set("n", "+", "<C-a>", { desc = "Increment number." }) -- INCREMENT NUMBERS
keymap.set("n", "-", "<C-x>", { desc = "Decrement number." }) -- DECREMENT NUMBERS
keymap.set("n", "n", "nzzzv") -- keep highlighted search term in the center of page
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<S-j>", "gJ", { desc = "Merge with following line.", noremap = true })
keymap.set("n", "dts", "a<C-R>=strftime('%a %d %b %Y @ %H:%M')<CR><ESC>", { desc = "Date & time stamp." })
keymap.set("n", "tds", "a<C-R>=strftime('%a %d %b %Y @ %H:%M')<CR><ESC>", { desc = "Date & time stamp." })
keymap.set("n", "ds", "a<C-R>=strftime('%a %d %b %Y')<CR><ESC>", { desc = "Date stamp (no time)." })
keymap.set("n", "ts", "a<C-R>=strftime('%H:%M')<CR><ESC>", { desc = "Time stamp (no date)." })
keymap.set("n", "y", '"+y')
keymap.set("v", "y", '"+y')
keymap.set("n", "y", '"+Y')
keymap.set("n", "yw", "bvey") -- SELECT AND COPY THIS WORD
--
-- WINDOW MANAGEMENT
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

-- BUFFERS AND TABS
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bv", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<leader>bx", function()
  vim.cmd("bufdo bd!")
end, { desc = "Close all open buffers" })

--
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tN", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })
keymap.set("n", "<tab>", "<cmd>tabnext<CR>", { desc = "Go to next tab." })
keymap.set("n", "<s-tab>", "<cmd>tabprevious<CR>", { desc = "Go to previous tab." })

keymap.set("n", "<C-Z>", "u") -- undo
keymap.set("i", "<C-Z>", "<C-O>u")
keymap.set("n", "<C-Y>", "<C-R>") -- redo
-- NOTES:
-- SUPER FIND & REPLACE by Primeagen https://youtu.be/w7i4amO_zaE?t=1724
-- copy the buffer to the system clipboard for use elsewhere https://youtu.be/w7i4amO_zaE?t=1633
--
--
