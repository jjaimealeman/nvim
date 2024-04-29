return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    -- keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    -- keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
    -- keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })

vim.keymap.set("n", "s", require('substitute').operator, { noremap = true }, { desc = "Substitute with motion." })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true }, { desc = "Substitute line." })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true }, { desc = "Substitute to end of the line." })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true }, { desc = "Substitute in visual mode." })
  end,
}
