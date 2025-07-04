return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "line",
      themable = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
        underline = true,
      },
      close_button_selected = {
        bold = true,
      },
      modified_selected = {
        bold = true,
      },
      duplicate_selected = {
        bold = true,
      },
      separator_selected = {
        bold = true,
      },
      indicator_selected = {
        bold = true,
      },
    },
  },
}
