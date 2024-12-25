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


return
    {
        -- Definite integral
        s({trig="intt", snippetType="autosnippet"},
            fmta(
                "\\int_{<>}^{<>}",
                {
                    i(1),
                    i(2)
                }
            ),

            { condition = in_mathzone }
        ),

        --limit
        s({trig="lim", snippetType="autosnippet"},
            fmta(
                "\\lim_{<>}",
                {
                    i(1),
                }
            ),
            { condition = in_mathzone }
        ),

        --sum
        s({trig="sum", snippetType="autosnippet"},
            fmta(
                "\\sum_{<>}^{<>}",
                {
                    i(1),i(2),
                }
            ),
            { condition = in_mathzone }
        ),

        --sum
        s({trig="if", snippetType="autosnippet"},
            t(
                "\\infty"
            ),
            { condition = in_mathzone }
        ),

        -- Derivatives
        s({trig="df", snippetType="autosnippet"},
            fmta(
                "\\diff <>",
                {
                    i(1),
                }
            ),
            { condition = in_mathzone }
        ),
        s({trig="dv", snippetType="autosnippet"},
            fmta(
                "\\odv{<>}{<>}",
                {
                    i(1),
                    i(2)
                }
            ),
            { condition = in_mathzone }
        ),
        s({trig="pdv", snippetType="autosnippet"},
            fmta(
                "\\pdv{<>}{<>}",
                {
                    i(1),
                    i(2)
                }
            ),
            { condition = in_mathzone }
        ),





    }
