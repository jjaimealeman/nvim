return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  -- https://www.lazyvim.org/extras/lang/tailwind
  opts = {
    servers = {
      tailwindcss = {
        -- exclude a filetype from the default_config
        filetypes_exclude = { "markdown" },
        -- add additional filetypes to the default_config
        filetypes_include = { "astro" },
        -- to fully override the default_config, change the below
        -- filetypes = {}
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        local tw = require("lspconfig.server_configurations.tailwindcss")
        opts.filetypes = opts.filetypes or {}
        -- Add default filetypes
        vim.list_extend(opts.filetypes, tw.default_config.filetypes)
        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)
        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,
    },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        -- FIX:
        -- change the leader key to [cX] where [c] equals Code, so all code related functions are related.
        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- default handler for installed servers
    local default_handler = function(server_name)
      vim.lsp.config(server_name, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server_name)
    end

    -- Svelte
    vim.lsp.config("svelte", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            -- Here use ctx.match instead of ctx.file
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })
    vim.lsp.enable("svelte")

    -- GraphQL
    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })
    vim.lsp.enable("graphql")

    -- Emmet
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = { "astro", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
    vim.lsp.enable("emmet_ls")

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
            disable = { "missing-fields" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- TypeScript (vtsls)
    vim.lsp.config("vtsls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("vtsls")

    -- Setup remaining servers with default config
    local servers = { "astro", "html", "cssls", "tailwindcss", "pyright" }
    for _, server in ipairs(servers) do
      default_handler(server)
    end
  end,
}
