return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter").setup({
      ensure_install = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "regex",
        "vue",
      },
    })

    -- Enable features via vim.treesitter (new API)
    vim.treesitter.language.register("markdown", "mdx")

    -- Incremental selection
    vim.keymap.set("n", "<C-space>", function()
      require("nvim-treesitter.incremental_selection").init_selection()
    end, { desc = "Init treesitter selection" })
    vim.keymap.set("v", "<C-space>", function()
      require("nvim-treesitter.incremental_selection").node_incremental()
    end, { desc = "Increment treesitter selection" })
    vim.keymap.set("v", "<bs>", function()
      require("nvim-treesitter.incremental_selection").node_decremental()
    end, { desc = "Decrement treesitter selection" })
  end,
}
