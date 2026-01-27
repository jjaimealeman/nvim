local keymap = vim.keymap

-- PAGE JUMPING
keymap.set("n", "n", "nzzzv") -- thanks ThePrimeagan https://youtu.be/w7i4amO_zaE?si=tx8WahMCShufwhEo&t=1583
keymap.set("n", "N", "Nzzzv") -- keeps cursor in the middle after searching.

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

keymap.set("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })

-- keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" }) -- SAVE WITH CTRL S
-- keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save" })
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- testing
keymap.set("n", "<C-Z>", "u", { desc = "Undo." })
keymap.set("n", "<C-Y>", "<C-R>", { desc = "Redo." })
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all." })

keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
--
-- THE YANKS
keymap.set("n", "<leader>yp", ":let @+ = expand('%:p')<CR>", { desc = "Yank path." })
keymap.set("n", "<leader>yw", "viwy", { desc = "Yank word." })
-- next greatest remap ever by ThePrimeagan
keymap.set("n", "<leader>yy", '"+y')
keymap.set("v", "<leader>yy", '"+y')
keymap.set("n", "<leader>YY", '"+y')

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
-- keymap.set("n", "n", "nzzzv") -- keep highlighted search term in the center of page
-- keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z", { desc = "Merge with following line." }) -- thanks ThePrimeagan https://youtu.be/w7i4amO_zaE?si=u3SfsyFoiqTPSHFr&t=1554
keymap.set("n", "<leader>zd", "a<C-R>=strftime('%a %d %b %Y')<CR><ESC>", { desc = "Date stamp." })
keymap.set("n", "<leader>zs", "a<C-R>=strftime('%a %d %b %Y @ %H:%M')<CR><ESC>", { desc = "Date & time stamp." })
keymap.set("n", "<leader>zt", "a<C-R>=strftime('%H:%M')<CR><ESC>", { desc = "Time stamp." })
keymap.set("n", "<leader>rr", function()
  -- Clear loaded modules cache to force reload
  for name, _ in pairs(package.loaded) do
    if name:match("^jjaime") then
      package.loaded[name] = nil
    end
  end
  -- Reload the config
  vim.cmd("source ~/.config/nvim/init.lua")
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim config" })

--
-- SPLIT WINDOW MANAGEMENT
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

-- BUFFERS
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Last Buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bv", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
keymap.set("n", "<leader>bx", function()
  vim.cmd("bufdo bd!")
end, { desc = "Close All Buffers" })

-- TABS
keymap.set("n", "<leader>Td", "<cmd>tabclose<CR>", { desc = "Close Tab" })
keymap.set("n", "<leader>Tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
keymap.set("n", "<leader>TN", "<cmd>tabnew %<CR>", { desc = "Duplicate Tab" })
keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer." })
keymap.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer." })

keymap.set("n", "<C-Z>", "u") -- undo
keymap.set("i", "<C-Z>", "<C-O>u")
keymap.set("n", "<C-Y>", "<C-R>") -- redo

-- In your init.lua or a keymap file
vim.keymap.set("n", "<leader>fC", function()
  -- Clear previous search highlights (optional, but good for refresh)
  vim.cmd("nohlsearch")
  -- Get the word under the cursor, escape special characters, and make it a whole word search
  local word = vim.fn.expand("<cword>")
  if word ~= "" then
    -- This sets the search register to the word, surrounded by '\<' and '\>' for whole word matching
    -- '\V' makes it very non-magic, so characters like '.', '*', etc. are matched literally
    -- vim.fn.setreg("/", '\\V\\<' .. vim.fn.escape(word, [[\/.*$^~[]]]) .. '\\>')
    vim.fn.setreg("/", "\\V\\<" .. vim.fn.escape(word, "\\/.*$^~[]") .. "\\>")
    vim.cmd("set hlsearch") -- Enable highlighting of search results
  end
end, { desc = "Find String under Cursor (highlight)" })

-- NOTES:
-- SUPER FIND & REPLACE by Primeagen https://youtu.be/w7i4amO_zaE?t=1724
-- copy the buffer to the system clipboard for use elsewhere https://youtu.be/w7i4amO_zaE?t=1633
--
--

-- GLANCE - LSP reference/definition viewer (<leader>gl*)
keymap.set("n", "<leader>gld", "<cmd>Glance definitions<CR>", { desc = "Glance definitions" })
keymap.set("n", "<leader>glr", "<cmd>Glance references<CR>", { desc = "Glance references" })
keymap.set("n", "<leader>gly", "<cmd>Glance type_definitions<CR>", { desc = "Glance type definitions" })
keymap.set("n", "<leader>gli", "<cmd>Glance implementations<CR>", { desc = "Glance implementations" })
