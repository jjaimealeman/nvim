return {
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.schedule(function()
        require("copilot").setup()
      end)
    end,
  },
  {
    "Edeneast/nightfox.nvim",
    lazy = false, -- make sure we load this during setup if it is your maincolorscheme
    priority = 1000, -- make sure we load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  {
    "mbbill/undotree",
    lazy = true,
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    lazy = false,
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
      require("cmp").config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }
    end,
  },

  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      filetypes = {
        "astro",
      },
    },
  },
  -- Add typescript
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "msx",
        "jsx",
        "tsx",
        "typescript",
        "yaml",
      },
    },
  },
}
