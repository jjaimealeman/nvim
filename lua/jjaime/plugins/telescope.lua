return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          height = 0.95,
          width = 0.7,
        },
        -- OPTIONS:
        -- telescope.defaults.path_display
        -- "hidden", "tail", "absolute", "smart", "shorten", "truncate"
        path_display = { "truncate" },
        -- prompt_prefix = "󰼛 ",
        -- prompt_prefix = " 🔍 ",
        prompt_prefix = "   ",
        selection_caret = "󱞩 ",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- BUG: this actions was causing an error.
            -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffer" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String under Cursor" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Files (Git)" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find Recent Files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find String (Live Grep)" })
    -- NOTE:
    -- To find all `todo-comments`:
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })

    -- NOTE:
    -- find keymaps
    keymap.set("n", "<leader>fp", function()
      require("telescope.builtin").keymaps({ cwd = require("lazy.core.config").options.root })
    end, { desc = "Find Keymaps" })
  end,
}
