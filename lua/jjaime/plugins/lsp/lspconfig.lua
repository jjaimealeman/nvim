return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "b0o/schemastore.nvim", -- JSON schemas for better completion
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
        opts.desc = "Smart rename (incremental)"
        keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { desc = "Incremental rename", expr = true, buffer = ev.buf }) -- smart rename with preview

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



    -- Configure TypeScript first (required for Volar)
    vim.lsp.config("vtsls", {
      cmd = { "vtsls", "--stdio" },
      capabilities = capabilities,
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    })

    -- Discover TypeScript SDK path dynamically
    local function find_typescript_sdk()
      local candidates = {
        -- pnpm global
        vim.fn.expand("$HOME/.local/share/pnpm/global/5/node_modules/typescript/lib"),
        -- npm global (nvm)
        vim.fn.trim(vim.fn.system("npm root -g")) .. "/typescript/lib",
        -- fallback: node_modules in project
        vim.fn.getcwd() .. "/node_modules/typescript/lib",
      }
      for _, path in ipairs(candidates) do
        if vim.fn.isdirectory(path) == 1 then
          return path
        end
      end
      return candidates[1] -- fallback to first candidate
    end

    -- Configure Vue Language Server
    vim.lsp.config("vue_ls", {
      cmd = { "vue-language-server", "--stdio" },
      capabilities = capabilities,
      root_markers = { "package.json", "vue.config.js", "nuxt.config.js", "nuxt.config.ts" },
      filetypes = { "vue" },
      init_options = {
        typescript = {
          tsdk = find_typescript_sdk(),
        },
      },
    })

    -- Configure JSON with SchemaStore
    vim.lsp.config("jsonls", {
      cmd = { "vscode-json-language-server", "--stdio" },
      capabilities = capabilities,
      filetypes = { "json", "jsonc" },
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- Configure other language servers
    local server_configs = {
      astro = { cmd = { "astro-ls", "--stdio" }, filetypes = { "astro" } },
      html = { cmd = { "vscode-html-language-server", "--stdio" }, filetypes = { "html" } },
      cssls = { cmd = { "vscode-css-language-server", "--stdio" }, filetypes = { "css", "scss", "less" } },
      tailwindcss = { 
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
      },
      pyright = { cmd = { "pyright-langserver", "--stdio" }, filetypes = { "python" } },
      svelte = {
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end,
      },
      graphql = {
        cmd = { "graphql-lsp", "server", "-m", "stream" },
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" }
      },
      emmet_ls = {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "astro", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" }
      },
      lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    -- Register and enable all servers
    for name, config in pairs(server_configs) do
      config.capabilities = capabilities
      config.root_markers = config.root_markers or { ".git", "package.json" }
      vim.lsp.config(name, config)
    end

    -- Enable all configured servers
    vim.lsp.enable("vtsls")
    vim.lsp.enable("vue_ls")
    vim.lsp.enable("jsonls")
    for name, _ in pairs(server_configs) do
      vim.lsp.enable(name)
    end


  end,
}
