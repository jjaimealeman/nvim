# CLAUDE.md

## My name is {JAIMITO}

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Overview

This is a personal Neovim configuration built from scratch using Lazy.nvim as the plugin manager. The configuration follows a modular structure under `lua/jjaime/` with separate modules for core settings, plugin management, and individual plugin configurations.

## Architecture

### Core Structure

- **Entry Point**: `init.lua` → loads `jjaime.core` and `jjaime.lazy`
- **Core Settings**: `lua/jjaime/core/` (options, keymaps, init)
- **Plugin Management**: `lua/jjaime/lazy.lua` (Lazy.nvim setup)
- **Plugin Configs**: `lua/jjaime/plugins/` (individual plugin configurations)
- **LSP Setup**: `lua/jjaime/plugins/lsp/` (mason.lua, lspconfig.lua)

### Key Design Principles

- Uses space as leader key (`<leader>`)
- Implements extensive custom keybindings following logical patterns
- Integrates modern LSP, formatting, and linting tools
- Provides comprehensive Git integration
- Supports TypeScript/JavaScript, Python, Lua, and web development

## Common Commands

### File Operations

- **Find files**: `<leader>ff` or `<leader><leader>`
- **Search in files**: `<leader>fs` (live grep)
- **Find recent files**: `<leader>fr`
- **Find git files**: `<leader>fg`
- **Find buffers**: `<leader>fb`

### File Explorer (Neo-tree)

- **Toggle explorer**: `<leader>ee`
- **Reveal current file**: `<leader>ef`
- **Close explorer**: `<leader>ec`
- **Refresh explorer**: `<leader>er`

### Terminal Integration (ToggleTerm)

- **Floating terminal**: `<leader>Tf`
- **Horizontal terminal**: `<leader>Th`
- **Vertical terminal**: `<leader>Tv`
- **Quick toggle**: `<C-\>`

### LSP Operations

- **Go to definition**: `gd`
- **Go to references**: `gR`
- **Go to implementations**: `gi`
- **Go to type definitions**: `gt`
- **Code actions**: `<leader>ca`
- **Rename**: `<leader>rn`
- **Show documentation**: `K`
- **Restart LSP**: `<leader>rs`

### Formatting and Linting

- **Format code**: `<leader>mp` (manual format)
- **Lint code**: `<leader>ml` (manual lint)
- Auto-formatting on save enabled with 1000ms timeout

### Git Integration

- **LazyGit**: `<leader>lg`
- **Stage hunk**: `<leader>hs`
- **Reset hunk**: `<leader>hr`
- **Preview hunk**: `<leader>hp`
- **Blame line**: `<leader>hb`
- **Git diff**: `<leader>hd`

### Diagnostics and Debugging

- **Toggle trouble**: `<leader>xx`
- **Workspace diagnostics**: `<leader>xw`
- **Document diagnostics**: `<leader>xd`
- **Line diagnostics**: `<leader>d`
- **Navigate diagnostics**: `[d` / `]d`

## Language Support

### Installed LSP Servers

- **Web**: `astro`, `vtsls` (TypeScript), `html`, `cssls`, `tailwindcss`, `svelte`, `emmet_ls`
- **General**: `lua_ls`, `graphql`, `pyright`

### Formatters

- **JavaScript/TypeScript/React**: `prettier`
- **Lua**: `stylua`
- **Python**: `isort` + `black`
- **Web formats**: `prettier` (HTML, CSS, JSON, YAML, Markdown)

### Linters

- **JavaScript/TypeScript/React/Svelte**: `eslint_d`
- **Python**: `pylint`

## Plugin Ecosystem

### Core Development Tools

- **LSP**: Mason + nvim-lspconfig for language server management
- **Completion**: nvim-cmp with multiple sources including Codeium AI
- **Formatting**: conform.nvim with auto-format on save
- **Linting**: nvim-lint with auto-lint on buffer events
- **Syntax**: nvim-treesitter for enhanced syntax highlighting

### Navigation and Search

- **Telescope**: Primary fuzzy finder with vertical layout
- **Neo-tree**: File explorer with git integration
- **Flash**: Enhanced navigation and search

### Git Integration

- **LazyGit**: Full-featured git interface
- **GitSigns**: Inline git status and hunk operations
- **DiffView**: Enhanced diff viewing

### Terminal and Productivity

- **ToggleTerm**: Multiple terminal configurations
- **Which-Key**: Keybinding discovery
- **Comment**: Smart commenting with JSX/TSX context awareness
- **WakaTime**: Time tracking for development sessions

## Development Workflow

1. **Project Navigation**: Start with `<leader>ff` to find files or `<leader>ee` to open file explorer
2. **Code Editing**: Use LSP features (`gd`, `gR`, `gi`) for code navigation
3. **Terminal Access**: `<leader>Tf` for quick terminal access
4. **Git Operations**: `<leader>lg` for LazyGit interface or `<leader>h*` for inline git operations
5. **Code Quality**: Auto-formatting on save, manual formatting with `<leader>mp`
6. **Diagnostics**: `<leader>xx` for trouble view, `<leader>d` for line diagnostics

## Custom Keybindings

### Window Management

- **Split windows**: `<leader>sv` (vertical), `<leader>sh` (horizontal)
- **Navigate splits**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`
- **Resize windows**: `<C-Up>`, `<C-Down>`, `<C-Left>`, `<C-Right>`

### Buffer Management

- **Switch buffers**: `<tab>` (next), `<S-tab>` (previous)
- **Close buffer**: `<leader>bd`
- **Switch to last buffer**: `<leader>bb`

### Text Manipulation

- **Move lines**: `<S-Up>`, `<S-Down>`
- **Indent/Deindent**: `<S-Right>`, `<S-Left>`
- **Search & Replace**: `<C-x>` (without confirmation), `<C-S-x>` (with confirmation)

### Special Features

- **Date stamps**: `<leader>zd` (date), `<leader>zs` (date & time), `<leader>zt` (time)
- **Yank operations**: `<leader>yp` (file path), `<leader>yy` (to system clipboard)
- **Save**: `<C-s>` (works in all modes)

## Configuration Files

The configuration is highly modular with each plugin having its own configuration file in `lua/jjaime/plugins/`. Key configuration files include:

- `lua/jjaime/core/options.lua` - Core Neovim options
- `lua/jjaime/core/keymaps.lua` - Global keybindings
- `lua/jjaime/plugins/lsp/mason.lua` - LSP server management
- `lua/jjaime/plugins/lsp/lspconfig.lua` - LSP configuration and keybindings
- `lua/jjaime/plugins/telescope.lua` - Fuzzy finder setup
- `lua/jjaime/plugins/neo-tree.lua` - File explorer configuration

## Persistence

The configuration uses a custom undo directory at `~/.config/nvim/undodir` for persistent undo across sessions. This allows for extensive undo history even after closing and reopening files.

