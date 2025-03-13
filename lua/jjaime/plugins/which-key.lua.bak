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
      ["<leader>b"] = { name = " Buffers" },
      ["<leader>c"] = { name = " Code" },
      ["<leader>e"] = { name = " Explorer" },
      ["<leader>f"] = { name = " Find with Telescope" },
      ["<leader>h"] = { name = " git" },
      ["<leader>m"] = { name = " Format" },
      ["<leader>r"] = { name = " Rename/Restart" },
      ["<leader>t"] = { name = " Tabs" },
      ["<leader>w"] = { name = " Sessions" },

      ["<leader>x"] = { name = " Trouble diagnostics" },
      ["<leader>y"] = { name = " Yank Yoink" },
      ["<leader>s"] = { name = " Splits" },
      ["<leader>T"] = { name = " ToggleTerm" },
      ["<leader>z"] = { name = " Random ??" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
-- TODO:
-- FIX THESE CONFLICTS!
-- BUG:
-- WhichKey: checking conflicting keymaps!
-- - WARNING conflicting keymap exists for mode "n", lhs: "yr", rhs: "d"
-- - WARNING conflicting keymap exists for mode "n", lhs: "yR", rhs: "d"
-- - WARNING conflicting keymap exists for mode "n", lhs: "s", rhs: "<Plug>(nvim-surround-normal)"
-- - WARNING conflicting keymap exists for mode "n", lhs: "S", rhs: "<Plug>(nvim-surround-normal-line)"
-- - WARNING conflicting keymap exists for mode "n", lhs: "gc", rhs: "<Plug>(comment_toggle_linewise)"
-- - WARNING conflicting keymap exists for mode "n", lhs: "gb", rhs: "<Plug>(comment_toggle_blockwise)"
--
--
-- NOTE:
-- built-in plugins:
-- marks: shows your marks when you hit one of the jump keys.
-- -- activate with ' and `
-- registers: shows the contents of your registers
-- -- activate with "
--
