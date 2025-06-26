return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      { "<leader>b", desc = " Buffers" },
      { "<leader>c", desc = " Code" },
      { "<leader>e", desc = " Explorer" },
      { "<leader>f", desc = " Find with Telescope" },
      { "<leader>h", desc = " git" },
      { "<leader>m", desc = " Format" },
      { "<leader>r", desc = " Rename/Restart" },
      { "<leader>t", desc = " Tabs" },
      { "<leader>w", desc = " Sessions" },

      { "<leader>x", desc = " Trouble diagnostics" },
      { "<leader>y", desc = " Yank Yoink" },
      { "<leader>s", desc = " Splits" },
      { "<leader>T", desc = " ToggleTerm" },
      { "<leader>z", desc = " Random ??" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- wk.register(opts.defaults)
  end,
}
