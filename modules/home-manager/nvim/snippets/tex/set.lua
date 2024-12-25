local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1))
    end
end

local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return{

    --Not element of ...
    s({trig="nin",snippetType="autosnippet"},
        t("\\notin"),
        { condition = in_mathzone }
    ),

    -- is/isnot a subset of ...
    s({trig="sub",snippetType="autosnippet"},
        t("\\subseteq"),
        { condition = in_mathzone }
    ),
    s({trig="nsub",snippetType="autosnippet"},
        t("\\subsetneq"),
        { condition = in_mathzone }
    ),

    -- union intersection
    s({trig="cup",snippetType="autosnippet"},
        t("\\cup"),
        { condition = in_mathzone }
    ),
    s({trig="cap",snippetType="autosnippet"},
        t("\\cap"),
        { condition = in_mathzone }
    ),

    -- Complement
    s({trig="comp",snippetType="autosnippet"},
        t("\\complement"),
        { condition = in_mathzone }
    ),

    -- Declare a set
    s({trig="set",snippetType="autosnippet"},
        fmta(
            "\\set{<>}",
            {
                i(1)
            }
        ),

        { condition = in_mathzone }
    ),

    s({trig="|",snippetType="autosnippet"},
        t("\\mid"),
        { condition = in_mathzone }
    ),

    -- set symbol
    s({trig="bb",snippetType="autosnippet"},
        fmta(
            "\\mathbb{<>}",
            {
                i(1)
            }
        ),
        { condition = in_mathzone }
    ),
}
