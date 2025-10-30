local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- @today snippet
  s("@today", {
    t("[["),
    f(function()
      return os.date("%Y-%m-%d")
    end),
    t("|"),
    f(function()
      local day = tonumber(os.date("%d"))
      return os.date("%b. ") .. day .. os.date(" %Y")
    end),
    t("]]"),
  }),

  -- @yesterday
  s("@yesterday", {
    t("[["),
    f(function()
      return os.date("%Y-%m-%d", os.time() - 86400)
    end),
    t("|"),
    f(function()
      local day = tonumber(os.date("%d", os.time() - 86400))
      return os.date("%b. ", os.time() - 86400) .. day .. os.date(" %Y", os.time() - 86400)
    end),
    t("]]"),
  }),

  -- @tomorrow
  s("@tomorrow", {
    t("[["),
    f(function()
      return os.date("%Y-%m-%d", os.time() + 86400)
    end),
    t("|"),
    f(function()
      local day = tonumber(os.date("%d", os.time() + 86400))
      return os.date("%b. ", os.time() + 86400) .. day .. os.date(" %Y", os.time() + 86400)
    end),
    t("]]"),
  }),

  -- Note callout (your most used one)
  s("note", {
    t("> [!note]+ "),
    i(1, "title"),
    t({ "", "> " }),
    i(0, "content"),
  }),
}
