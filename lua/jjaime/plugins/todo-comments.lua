return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    FIX = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "BROKE", "BROKEN" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO", "OPTIONS" } },
    OPTIONS = { icon = " ", color = "hint", alt = { "INFO", "OPTIONS" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },

  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
  -- TODO: do something.
  -- HACK: weird code warning.
  -- FIX: this code should be fixed.
  --
  -- NOTE:
  -- OPTIONS:
  --
  -- "<leader>xt"
}
