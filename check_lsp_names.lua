local lsp_names = {
  "astro",
  "tsserver",
  "html",
  "cssls",
  "tailwindcss",
  "svelte", 
  "lua_ls",
  "graphql",
  "emmet_ls",
  "prismals",
  "pyright",
}

print("Mason-lspconfig available servers:")
local mason_lspconfig = require("mason-lspconfig")
local available_servers = mason_lspconfig.get_available_servers()
for _, server in ipairs(available_servers) do
  print(" - " .. server)
end

print("\nServers to check:")
for _, server in ipairs(lsp_names) do
  local valid = false
  for _, available in ipairs(available_servers) do
    if server == available then
      valid = true
      break
    end
  end
  print(" - " .. server .. ": " .. (valid and "Valid" or "Invalid"))
end