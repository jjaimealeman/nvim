# Neovim Config

Personal Neovim configuration built from scratch using [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

I had previously been using [LazyVim by Folke](https://www.lazyvim.org/), adding my own plugins and understanding the `neovim` way. But the more time I spent at `/r/neovim`, the more I wanted to recreate it from scratch.

I started over with [Kickstart](https://github.com/nvim-lua/kickstart.nvim/) and then this guide by [Josean Martinez](https://youtu.be/6pAG3BHurdM?si=mr4V-jd-QyoGWwXF) to get a better idea on how to structure my `nvim` configuration.

I know some of the keymaps don't really make sense to others, but they work for me. A neovim config SHOULD be a personal project.

---

## Structure

```
~/.config/nvim/
├── init.lua                          # Entry point -> loads core + lazy
├── lua/jjaime/
│   ├── core/
│   │   ├── init.lua                  # Core loader
│   │   ├── options.lua               # Neovim options
│   │   └── keymaps.lua               # Global keybindings
│   ├── lazy.lua                      # Lazy.nvim bootstrap
│   └── plugins/                      # Individual plugin configs
│       ├── lsp/
│       │   ├── lspconfig.lua         # LSP server configuration
│       │   └── mason.lua             # LSP server management
│       ├── treesitter.lua            # Syntax highlighting
│       ├── telescope.lua             # Fuzzy finder
│       ├── neo-tree.lua              # File explorer
│       ├── vue-enhancements.lua      # Vue/Nuxt goto definition
│       ├── glance.lua                # LSP reference viewer
│       ├── inc-rename.lua            # Incremental rename preview
│       └── ...                       # 40+ plugin configs
└── changelog/                        # Dev changelog entries
```

## Language Support

Primarily configured for **Vue/Nuxt** and web development.

### LSP Servers

| Server | Language |
|--------|----------|
| `vue_ls` | Vue 3 / Nuxt 3 |
| `vtsls` | TypeScript / JavaScript |
| `jsonls` | JSON with SchemaStore validation |
| `html` | HTML |
| `cssls` | CSS / SCSS / Less |
| `tailwindcss` | Tailwind CSS |
| `astro` | Astro |
| `svelte` | Svelte |
| `emmet_ls` | Emmet abbreviations |
| `graphql` | GraphQL |
| `pyright` | Python |
| `lua_ls` | Lua |

### Formatters

- **JS/TS/Vue/HTML/CSS/JSON/YAML/Markdown** — `prettier`
- **Lua** — `stylua`
- **Python** — `isort` + `black`

### Linters

- **JS/TS/Vue/Svelte** — `eslint_d`
- **Python** — `pylint`

## Key Bindings

Leader key: `<Space>`

### Navigation

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fs` | Live grep |
| `<leader>fr` | Recent files |
| `<leader>ee` | Toggle file explorer |
| `gd` | Go to definition |
| `gR` | Show references |
| `gi` | Show implementations |
| `K` | Show documentation |

### Vue/Nuxt Specific

| Key | Action |
|-----|--------|
| `<leader>gld` | Glance definitions |
| `<leader>glr` | Glance references |
| `<leader>gli` | Glance implementations |
| `<leader>rn` | Incremental rename (live preview) |

### Git

| Key | Action |
|-----|--------|
| `<leader>lg` | LazyGit |
| `<leader>hs` | Stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

### General

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `<S-Up/Down>` | Move lines |
| `<S-Left/Right>` | Indent/Deindent |
| `<tab>` / `<S-tab>` | Next/Previous buffer |
| `<leader>sv` / `<leader>sh` | Split vertical/horizontal |
| `<leader>xx` | Toggle trouble diagnostics |

## Plugin Highlights

- **LSP** — Mason + nvim-lspconfig with Vue/TypeScript/JSON support
- **Completion** — nvim-cmp with multiple sources
- **Formatting** — conform.nvim with auto-format on save
- **Linting** — nvim-lint with auto-lint on buffer events
- **Syntax** — nvim-treesitter (main branch)
- **Navigation** — Telescope, Neo-tree, Flash, Glance
- **Git** — LazyGit, GitSigns, DiffView
- **Vue/Nuxt** — vue-goto-definition, Vue Language Server
- **Markdown** — render-markdown, Obsidian integration

## Setup on a New Machine

```bash
# Prerequisites (Arch Linux)
sudo pacman -S base-devel gcc nodejs pnpm tree-sitter-cli

# Clone
git clone https://github.com/jjaimealeman/nvim ~/.config/nvim

# Launch nvim — Lazy.nvim bootstraps and installs everything
nvim
```

Mason will auto-install LSP servers, formatters, and linters on first launch.

## Machines

- ThinkPad T480 — Arch Linux + Hyprland (primary)
- Blackview MP60 — Arch Linux + Niri
