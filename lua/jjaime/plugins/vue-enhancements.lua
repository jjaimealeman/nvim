return {
  {
    "catgoose/vue-goto-definition.nvim",
    event = "BufRead *.vue,*.ts,*.js", -- Lazy load on Vue/TS files
    opts = {
      filters = {
        auto_imports = true,
        auto_components = true,
        import_same_file = true,
        declaration = true,
        duplicate_filename = true,
      },
      detection = {
        nuxt = function()
          return vim.fn.glob(".nuxt/") ~= ""
        end,
        vue3 = function()
          return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
        end,
        priority = { "nuxt", "vue3" },
      },
      lsp = { override_definition = true },
      debounce = 200,
    },
  },
}