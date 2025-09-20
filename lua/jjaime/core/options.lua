vim.g.mapleader = " "
vim.g.autoformat = true

vim.cmd("let g:netrw_liststyle = 3")

vim.opt.autoindent = true -- copy indent from current line
vim.opt.autowrite = true -- enable auto write
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position.
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
-- vim.opt.guifont = "Dank\\ Mono:h11"
-- vim.opt.guifont = "DejaVu Serif:h12"
-- vim.opt.guifont = "DejaVu\\ Sans\\ Mono:h12"
-- vim.opt.guifont = "Operator Mono Light Italic:h12"
-- vim.opt.guifont = "Operator Mono:h12"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.laststatus = 3
vim.opt.list = true -- Show some invisible characters (tabs...
-- vim.opt.listchars = "tab:╶─╴,lead:·,trail:▒,eol:↲,extends:►,precedes:◄"
-- vim.opt.listchars = "eol:↲,tab:»·,trail:·,extends:>,precedes:<,nbsp:␣"
vim.opt.listchars = "eol:↲,tab:»·,trail:▒,extends:►,precedes:◄"
vim.opt.mouse = "a" -- enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 20 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.updatetime = 200 -- save swap file and trigger CursorHold

-- Enable focus events for tmux compatibility
vim.api.nvim_command("set t_fd=") -- disable focus gained escape sequence
vim.api.nvim_command("set t_fe=") -- disable focus lost escape sequence
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- wrap at word boundaries (no mid‑word splits)
vim.opt.breakindent = true -- preserve indent on wrapped lines
vim.opt.showbreak = "↪ " -- show this before wrapped portions
vim.opt.textwidth = 160
-- persistent undo directory
local undodir = vim.fn.expand("~/.config/nvim/undodir")
vim.opt.undodir = undodir
vim.fn.mkdir(undodir, "p")
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Auto-reload files when changed externally
vim.api.nvim_create_autocmd({ 
  "BufEnter",     -- When switching to a buffer (like tab switching)
  "CursorHold",   -- When cursor stops moving in normal mode (after updatetime=200ms)
  "CursorHoldI",  -- When cursor stops moving in insert mode (after updatetime=200ms)
  "FocusGained",  -- When Neovim window gains focus (Alt+Tab back to terminal)
  "BufWinEnter",  -- When a buffer is displayed in a window (opening splits/tabs)
  "WinEnter",     -- When entering a window (moving between splits)
  "CmdwinLeave"   -- When leaving command-line window (after running commands)
}, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Show notification when file is reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.INFO)
  end,
})

-- More aggressive file checking with timer (for true live updates)
local timer = vim.loop.new_timer() -- create a new timer
timer:start(1000, 1000, vim.schedule_wrap(function() -- check every 1 second
  vim.cmd("checktime") -- check all buffers for external changes
end))
