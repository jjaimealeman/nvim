return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "++" },
      change = { text = "│+" },
      delete = { text = "--" },
      topdelete = { text = "^^" },
      changedelete = { text = "│-" },
      untracked = { text = "┆┆" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Git Next Hunk")
      map("n", "[h", gs.prev_hunk, "Git Previous Hunk")

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, "Git Stage Hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Git Reset Hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Git Stage Hunk")
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Git Reset Hunk")

      map("n", "<leader>hS", gs.stage_buffer, "Git Stage Buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Git Reset Buffer")

      map("n", "<leader>hu", gs.undo_stage_hunk, "Git Undo Stage Hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Git Preview Hunk")

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Git Blame Line")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Git Toggle Blame")

      map("n", "<leader>hd", gs.diffthis, "Git Diff")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Git Diff (HEAD)")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git Select Hunk")
    end,
  },
}
