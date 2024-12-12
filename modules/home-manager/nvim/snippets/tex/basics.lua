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

    -- Start basic document
    s({trig="init", dscr="Start a new document"},
        fmta(
            [[
\documentclass[12pt]{article}
 
% Packages
\usepackage[utf8]{inputenc}
\usepackage{derivative}
\usepackage{amsmath,amssymb}
\usepackage[margin=1in]{geometry}
\usepackage{fancyhdr}
\usepackage{enumerate}
\usepackage{moreenum}
\usepackage[shortlabels]{enumitem}
\usepackage{graphicx}

% Nice inline limits
\apptocmd{\lim}{\limits}{}{}

% Equation with numberwithin notation
\numberwithin{equation}{section}

% Title of the document
\title{<>}
\author{Julien Racette}
\date{\today}

% Headers and footers
\pagestyle{fancy}
\fancyhead[l]{Julien Racette}
\fancyhead[c]{<>}
\fancyhead[r]{\today}
\fancyfoot[c]{\thepage}
\renewcommand{\headrulewidth}{0.2pt}
\setlength{\headheight}{15pt} 


\begin{document}
\maketitle
\pagebreak
\section{<>}
\begin{enumerate}[label={\bfseries Problem \arabic*:},leftmargin=1in]
\item <>

<>
\end{enumerate}
\end{document}

            ]],
            {i(1,"title"),rep(1),i(2,"section"),i(3,"\\hphantom \\\\"),i(4)}
        )
    ),

    -- New page snippet
    s({trig="nP", snippetType="autosnippet"},
        t("\\newpage")
    ),

    -- Align snippet
    s({trig="aA",snippetType="autosnippet"},
        fmta(
            [[
\begin{align*}
    &=<>
\end{align*}]],
            { d(1,get_visual) }
        )
    ),

    --Text snippet
    s({trig="tt",snippetType="autosnippet"},
        fmta(
        [[
        \text{<>}]]
            ,{d(1,get_visual)}
        ),
        {condition = in_mathzone}
            ),

    -- Equation
    s({trig="nN",snippetType="autosnippet", dscr="Expands 'eq' into an equation environment"},
        fmta(
            [[
\begin{equation*}
    <>
\end{equation*}]],
            { d(1,get_visual) }
        )
    ),

    -- Math 
    s({trig="mM",snippetType="autosnippet", dscr="Expands mm into an math environment"},
        fmta(
            [[
\begin{math}
    <>
\end{math}]],
            { d(1,get_visual) }
        )
    ),

    -- Env
    s({trig="env",snippetType="autosnippet"},
        fmta(
            [[
\begin{<>}
    <>
\end{<>}]],
            {i(1),d(2,get_visual),rep(1) }
        )
    ),

    -- Text decorations
    s({trig="bold",snippetType="autosnippet"},
        fmta(
            [[
\textbf{<>}]],
            { d(1,get_visual) }
        )
    ),
s({trig="italic",snippetType="autosnippet" },
        fmta(
            [[
\textit{<>}]],
            { d(1,get_visual) }
        )
    ),
s({trig="underline",snippetType="autosnippet"},
        fmta(
            [[
\underline{<>}]],
            { d(1,get_visual) }
        )
    ),





}

