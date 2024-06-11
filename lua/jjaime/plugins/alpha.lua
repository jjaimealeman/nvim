return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- SET HEADER
    dashboard.section.header.val = {
      "                                                              ",
      "	                                                             ",
      "	 888b    888                  888     888 d8b                ",
      "	 8888b   888                  888     888 Y8P                ",
      "	 88888b  888                  888     888                    ",
      "	 888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.   ",
      "	 888 Y88b888 d8P  Y8b d88  88b Y88b d88P  888 888  888  88b  ",
      "	 888  Y88888 88888888 888  888  Y88o88P   888 888  888  888  ",
      "	 888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888  ",
      "	 888    Y888  YY8888   YY88PY     Y8P     888 888  888  888  ",
      "	                                                             ",
      "                                                              ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼    Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("t", "    Toggle tree explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("n", "    New File", "<cmd>ene<CR>"),
      dashboard.button("s", "    Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "󰁯    Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("l", "󰒲    Load Lazy", "<cmd> Lazy <cr>"),
      dashboard.button("q", "    Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
