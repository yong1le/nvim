local ls = require("luasnip")
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}
-- latex stuff
local limit = s("lim", {
  t("\\lim_{"), i(1, '#'), t('}{'), i(2, 'function'), t('}')
})
table.insert(snippets, limit)

local int = s("int", {
  t("\\int_{"), i(1, ''), t('}^{'), i(2, ''), t('}{'), i(3, ''), t('}dx')
})
table.insert(snippets, int)

local infinity = s("inf", {
  t("\\infty")
})
table.insert(snippets, infinity)

local box = s("box", {
  t({"\\begin{mdframed}","  "}),
  i(1, ""), t({'',''}),
  t({"\\end{mdframed}"}),
})
table.insert(snippets, box)

local aligntext = s("aligntext", {
  t({"\\begin{align*}", "  "}),
  i(1, ""), t({'',''}),
  t({"\\end{align*}"}),
})
table.insert(snippets, aligntext)

local enumerate = s("enumerate", {
  t({"\\begin{enumerate}", "  "}),
  t("\\item "), i(1, ""),t({'',''}),
  t({"\\end{enumerate*}"}),
})
table.insert(snippets, enumerate)

local proof = s("proof", {
  t({"\\begin{proof}", "  "}),
  i(1, ""),t({'',''}),
  t({"\\end{proof*}"}),
})
table.insert(snippets, proof)

-- md stuff
local code = s("cd", {
  t("```"), i(1,"lang"),
  t({'',''}), i(2,""), t({'',''}),
  t("```")
})
table.insert(snippets, code)

return snippets, autosnippets
