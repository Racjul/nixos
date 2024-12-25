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

    -- Examples of Greek letter snippets

    s({trig=";a", snippetType="autosnippet"},
        {
            t("\\alpha"),
        }
    ),
    s({trig=";b", snippetType="autosnippet"},
        {
            t("\\beta"),
        }
    ),
    s({trig=";g", snippetType="autosnippet"},
        {
            t("\\gamma"),
        }
    ),
    s({trig=";D", snippetType="autosnippet"},
        {
            t("\\Delta"),
        }
    ),
    s({trig=";d", snippetType="autosnippet"},
        {
            t("\\delta"),
        }
    ),
    s({trig=";e", snippetType="autosnippet"},
        {
            t("\\epsilon"),
        }
    ),
    s({trig=";z", snippetType="autosnippet"},
        {
            t("\\zeta"),
        }
    ),
    s({trig=";h", snippetType="autosnippet"},
        {
            t("\\eta"),
        }
    ),
    s({trig=";T", snippetType="autosnippet"},
        {
            t("\\Theta"),
        }
    ),
    s({trig=";t", snippetType="autosnippet"},
        {
            t("\\theta"),
        }
    ),
    s({trig=";i", snippetType="autosnippet"},
        {
            t("\\iota"),
        }
    ),
    s({trig=";k", snippetType="autosnippet"},
        {
            t("\\kappa"),
        }
    ),
    s({trig=";L", snippetType="autosnippet"},
        {
            t("\\Lambda"),
        }
    ),
    s({trig=";l", snippetType="autosnippet"},
        {
            t("\\lambda"),
        }
    ),
    s({trig=";m", snippetType="autosnippet"},
        {
            t("\\mu"),
        }
    ),
    s({trig=";n", snippetType="autosnippet"},
        {
            t("\\nu"),
        }
    ),
    s({trig=";X", snippetType="autosnippet"},
        {
            t("\\Xi"),
        }
    ),
    s({trig=";x", snippetType="autosnippet"},
        {
            t("\\xi"),
        }
    ),
    s({trig=";P", snippetType="autosnippet"},
        {
            t("\\Pi"),
        }
    ),
    s({trig=";p", snippetType="autosnippet"},
        {
            t("\\pi"),
        }
    ),
    s({trig=";vp", snippetType="autosnippet"},
        {
            t("\\varpi"),
        }
    ),
    s({trig=";S", snippetType="autosnippet"},
        {
            t("\\Sigma"),
        }
    ),
    s({trig=";s", snippetType="autosnippet"},
        {
            t("\\sigma"),
        }
    ),
    s({trig=";t", snippetType="autosnippet"},
        {
            t("\\tau"),
        }
    ),
    s({trig=";F", snippetType="autosnippet"},
        {
            t("\\Phi"),
        }
    ),
    s({trig=";f", snippetType="autosnippet"},
        {
            t("\\phi"),
        }
    ),
    s({trig=";vf", snippetType="autosnippet"},
        {
            t("\\varphi"),
        }
    ),
    s({trig=";c", snippetType="autosnippet"},
        {
            t("\\chi"),
        }
    ),
    s({trig=";P", snippetType="autosnippet"},
        {
            t("\\Psi"),
        }
    ),
    s({trig=";ps", snippetType="autosnippet"},
        {
            t("\\psi"),
        }
    ),
    s({trig=";O", snippetType="autosnippet"},
        {
            t("\\Omega"),
        }
    ),
    s({trig=";o", snippetType="autosnippet"},
        {
            t("\\omega"),
        }
    ),



}
