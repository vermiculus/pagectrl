\RequirePackage{expl3}
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesExplClass
{test-case}
{2014/12/10}
{1.0}
{A class for test cases}

% l3build is a much better solution, but I don't have the time for
% that right yet.

\LoadClass{article}

\RequirePackage{xparse}

\RequirePackage[a4paper]{geometry}

\NewDocumentCommand \Replicate { m m }
  { \prg_replicate:nn {#1} {#2} }
\NewDocumentCommand \Pages { m O{test\newpage}}
  { \prg_replicate:nn {#1} {#2} }
