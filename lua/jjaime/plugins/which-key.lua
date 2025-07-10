return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = { spelling = true },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and its description
      group = "+", -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      mode = { "n", "v" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Git" },
      { "<leader>m", group = "Format" },
      { "<leader>r", group = "Rename/Restart" },
      { "<leader>s", group = "Splits" },
      { "<leader>t", group = "ToggleTerm" },
      { "<leader>T", group = "Tabs" },
      { "<leader>w", group = "Workspace" },
      { "<leader>x", group = "Trouble" },
      { "<leader>y", group = "Yank" },
      { "<leader>z", group = "Misc" },
    })
  end,
}

