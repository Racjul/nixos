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

local in_text = function()
  return not in_mathzone()
end

return{
-- Theorems
    s({trig="thm",snippetType="autosnippet"},
        fmta(
            [[
            \thm{}{<>}
]],
            { d(1,get_visual) },
            {condition = in_text}
        )
    ),

-- Definitions
    s({trig="dfn",snippetType="autosnippet"},
        fmta(
            [[
            \dfn{}{<>}
]],
            { d(1,get_visual) },
            {condition = in_text}
        )
    ),


-- Corrolary
        s({trig="cor",snippetType="autosnippet"},
            fmta(
                [[
                \cor{}{<>}
        ]],
                { d(1,get_visual) }
            ),
        {condition = in_text}
        ),

--Example
    s({trig="exp",snippetType="autosnippet"},
            fmta(
                [[
                \ex{}{<>}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),
--Lemme
    s({trig="lem",snippetType="autosnippet"},
            fmta(
                [[
                \mlenma{}{<>}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),

--Proof
    s({trig="prf",snippetType="autosnippet"},
            fmta(
                [[
                \begin{myproof}
                    <>
                \end{myproof}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),

--Question
    s({trig="qs",snippetType="autosnippet"},
            fmta(
                [[
                \qs{}{<>}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),

--Question
    s({trig="sl",snippetType="autosnippet"},
            t("\\sol"),
                {condition = in_text}
        ),

--Note
    s({trig="nt",snippetType="autosnippet"},
            fmta(
                [[
                \nt{}{<>}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),
--Claim
    s({trig="clm",snippetType="autosnippet"},
            fmta(
                [[
                \clm{}{<>}
    ]],
                { d(1,get_visual) }
            ),
                {condition = in_text}
        ),
}

