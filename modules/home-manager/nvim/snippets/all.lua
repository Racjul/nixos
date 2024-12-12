return {
    s = require("luasnip").snippet;
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello, world!") }
  ),
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
}
