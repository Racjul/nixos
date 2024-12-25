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


return {
    -- \frac
    s({trig="ff",snippetType="autosnippet", dscr="Expands 'ff' into '\frac{}{}'"},
        fmta(
            "\\frac{<>}{<>}",
            {
                i(1),
                i(2)
            }
        ),
        { condition = in_mathzone }
    ),

    --\binomial
    s({trig="bin",snippetType="autosnippet"},
        fmta(
            "\\binom{<>}{<>}",
            {
                i(1,"n"),
                i(2,"k")
            }
        ),
        { condition = in_mathzone }
    ),

    -- Box
    s({trig="box",snippetType="autosnippet"},
        fmta(
            [[
\boxed{<>}
]],
            { d(1,get_visual) }
        )
    ),
    -- \sqrt
    s({trig="sqrt",snippetType="autosnippet"},
        fmta(
            "\\sqrt{<>}",
            {
                i(1)
            }
        ),
        {condition = in_mathzone}
    ),
    s({trig="for",snippetType="autosnippet"},
        t(
            "\\forall"
        ),
        {condition = in_mathzone}
    ),
s({trig="in",snippetType="autosnippet"},
        t(
            "\\in"
        ),
        {condition = in_mathzone}
    ),
s({trig="ex",snippetType="autosnippet"},
        t(
            "\\exists"
        ),
        {condition = in_mathzone}
    ),
    -- Left and right parenthese
    s({trig="ll",snippetType="autosnippet"},
        t("\\left"),
        { condition = in_mathzone }
    ),
    s({trig="rr",snippetType="autosnippet"},
        t("\\right"),
        { condition = in_mathzone }
    ),

    --log
    s({trig="log",snippetType="autosnippet"},
        t("\\log"),
        { condition = in_mathzone }
    ),

    -- trig
    -- Examples of trigonometric function snippets
    s({trig="sin", snippetType="autosnippet"},
        {
            t("\\sin"),
        { condition = in_mathzone }
        }
    ),
    s({trig="cos", snippetType="autosnippet"},
        {
            t("\\cos"),
        { condition = in_mathzone }
        }
    ),
    s({trig="tan", snippetType="autosnippet"},
        {
            t("\\tan"),
        { condition = in_mathzone }
        }
    ),
    s({trig="csc", snippetType="autosnippet"},
        {
            t("\\csc"),
        { condition = in_mathzone }
        }
    ),
    s({trig="sec", snippetType="autosnippet"},
        {
            t("\\sec"),
        { condition = in_mathzone }
        }
    ),
    s({trig="cot", snippetType="autosnippet"},
        {
            t("\\cot"),
        { condition = in_mathzone }
        }
    ),
    s({trig="arcsin", snippetType="autosnippet"},
        {
            t("\\arcsin"),
        { condition = in_mathzone }
        }
    ),
    s({trig="arccos", snippetType="autosnippet"},
        {
            t("\\arccos"),
        { condition = in_mathzone }
        }
    ),
    s({trig="arctan", snippetType="autosnippet"},
        {
            t("\\arctan"),
        { condition = in_mathzone }
        }
    ),
        s({trig="pro", snippetType="autosnippet"},
            fmta("\\probP[<>]",
        {
            i(1)
        }),
            { condition = in_mathzone }
        ),




}

