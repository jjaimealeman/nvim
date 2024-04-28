vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj."})

keymap.set("n", "<leader>nh", ":noh<CR>", { desc = "Clear search highlights." })

-- increment and decrement numbers 7130
keymap.set("n", "+", "<C-a>", { desc = "Increment number." })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number." })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to new tab." })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab." })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })
