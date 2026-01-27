return {
  "smjonas/inc-rename.nvim",
  lazy = true,
  cmd = "IncRename",
  config = function()
    require("inc_rename").setup({
      -- The command to run after a rename
      cmd_name = "IncRename",
      -- The highlight group used for highlighting the identifier being renamed
      hl_group = "Substitute",
      -- Whether to preview the changes or not
      preview_empty_name = false,
      -- Whether an empty buffer name should be displayed when the renaming is not active
      show_message = true,
      -- The type of the external input buffer to use (dressing.nvim or builtin)
      input_buffer_type = nil, -- Will use dressing.nvim if available
      -- Callback to run after renaming
      post_hook = nil,
    })
  end,
}