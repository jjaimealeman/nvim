# 2026-01-27 - Vue/Nuxt LSP Enhancements and Config Cleanup

**Keywords:** [CONFIG] [FEATURE] [REFACTOR]
**Session:** Afternoon, Duration (~1 hour)
**Commit:** TBD

## What Changed

- File: `lua/jjaime/plugins/lsp/lspconfig.lua`
  - Added Vue Language Server (vue_ls) with dynamic TypeScript SDK discovery
  - Added JSON Language Server with SchemaStore schema validation
  - Added explicit vtsls (TypeScript) configuration with filetypes and root markers
  - Refactored all server configs into table-driven loop for maintainability
  - Replaced `vim.lsp.buf.rename` with inc-rename.nvim for live preview
  - Replaced old tailwindcss opts block with inline server config (vue filetype included)
  - Added `schemastore.nvim` as dependency
- File: `lua/jjaime/plugins/lsp/mason.lua`
  - Added `vue_ls` and `jsonls` to ensure_installed
- File: `lua/jjaime/plugins/vue-enhancements.lua` (NEW)
  - Added `vue-goto-definition.nvim` for improved goto-definition in Vue/Nuxt files
- File: `lua/jjaime/plugins/glance.lua` (NEW)
  - Added LSP reference/definition viewer with side-by-side UI
- File: `lua/jjaime/plugins/inc-rename.lua` (NEW)
  - Added incremental rename with live preview
- File: `lua/jjaime/plugins/obsidian.lua` (NEW)
  - Added Obsidian vault integration for markdown writing in Neovim
- File: `lua/jjaime/core/keymaps.lua`
  - Added Glance keybindings under `<leader>gl*` (avoids LSP conflicts)
- File: `lua/jjaime/core/options.lua`
  - Expanded sessionoptions for better session persistence (folds, winpos, terminal, localoptions)
- File: `lua/jjaime/plugins/auto-session.lua`
  - Updated to newer API property names (auto_restore, suppressed_dirs)
- File: `lua/jjaime/plugins/render-markdown.lua`
  - Disabled LaTeX rendering to suppress warnings
- File: `lua/jjaime/plugins/treesitter.lua`
  - Added `regex` parser for noice.nvim
- File: `lazy-lock.json`
  - Added new plugins (glance, inc-rename, obsidian, schemastore, vue-goto-definition)
  - Updated existing plugin versions
  - Removed unused plugin entries (dap, neotest, spectre, rest, live-server, package-info)

## Why

Preparing Neovim config for Vue/Nuxt development workflow. The original opencode changes included many unrelated plugins (debugging, REST client, test runner, live-server, spectre, package-info). These were stripped out, keeping only Vue/Nuxt-relevant additions plus obsidian.nvim for markdown writing. Hardcoded TypeScript SDK path was replaced with dynamic discovery to ensure portability across machines (ThinkPad T480 → Blackview MP60).

## Issues Encountered

- opencode added 10 new plugins when only ~4 were needed for Vue/Nuxt work
- Hardcoded pnpm path (`~/.local/share/pnpm/global/5/`) would break on other machines
- Original `<leader>g*` Glance keybindings conflicted with existing LSP mappings — moved to `<leader>gl*`
- Tailwindcss config block was removed but re-added as inline server config with Vue filetype support

## Dependencies

- Added: `b0o/schemastore.nvim` (JSON schema completion)
- Added: `dnlhc/glance.nvim` (LSP reference viewer)
- Added: `smjonas/inc-rename.nvim` (incremental rename)
- Added: `epwalsh/obsidian.nvim` (Obsidian integration)
- Added: `catppuccin/vue-goto-definition.nvim` (Vue goto-definition)
- Removed: nvim-dap, nvim-dap-ui, nvim-dap-virtual-text, neotest, neotest-jest, neotest-vitest, nvim-spectre, rest.nvim, live-server.nvim, package-info.nvim, FixCursorHold.nvim, mason-nvim-dap.nvim

## Testing Notes

- Manual testing required: open a Vue/Nuxt project and verify vue_ls attaches
- Verify `<leader>rn` triggers inc-rename preview
- Verify `<leader>gl*` opens Glance panels
- Verify JSON files get schema completion

## Next Steps

- [ ] Clone config on Blackview MP60 and verify it works
- [ ] Consider chezmoi for dotfile management across machines
- [ ] Test TypeScript SDK discovery on the mini PC

---

**Branch:** feature/opencode-upgrades
**Issue:** N/A
**Impact:** MEDIUM - LSP and plugin configuration changes
