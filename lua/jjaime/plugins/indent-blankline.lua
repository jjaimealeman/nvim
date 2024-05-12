return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",

  indent = {
    char = "│",
    tab_char = "│",
  },
}
