\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SDEWES2026}[2025/12/01 SDEWES latex class - Mathias Hofmann, Berlin, Germany, https://mathias-hofmann.com/]

% base class
\LoadClass[12pt, a4paper, oneside]{article}

% packages
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[babel]{csquotes}

\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{caption}

\RequirePackage{titlesec}

\RequirePackage{scrextend}
\RequirePackage[symbol]{footmisc}

\RequirePackage{multirow,multicol,booktabs}

\RequirePackage{amsmath}
\RequirePackage{eurosym}

\RequirePackage{siunitx}
\sisetup{locale=US}

\RequirePackage[version=4]{mhchem}

\RequirePackage[auto]{microtype}
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

\RequirePackage{nomencl}

\RequirePackage{url}
\urlstyle{same}

\RequirePackage[
  backend=biber,
  style=SDEWES,
  sorting=none
]{biblatex}

\RequirePackage[hidelinks]{hyperref}

\RequirePackage[english, capitalise]{cleveref}

% page layout
\geometry{
  a4paper,
  textwidth=160mm,
  textheight=247mm,
  hmarginratio=1:1,
  vmarginratio=1:1,
  headheight=0pt,
  headsep=0pt,
  footskip=6mm,
  includehead=false,
  includefoot=false
}

% basic text formatting
\setstretch{1.0}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\pagestyle{plain}

% standard font size
\newcommand{\NormalFont}{\fontsize{12}{14.4}\selectfont}

% title font sizes
\newcommand{\TitleFont}{\fontsize{14}{16.8}\bfseries\selectfont}
\newcommand{\AuthorFont}{\fontsize{12}{11}\selectfont}
\newcommand{\AbstractFont}{\fontsize{12}{14.4}\selectfont}

%  specific lenghts at titlepage
\newlength{\SDEWES@TitleTopExtra}
\setlength{\SDEWES@TitleTopExtra}{0pt}

\newlength{\SDEWES@TitleToAuthorsSkip}
\setlength{\SDEWES@TitleToAuthorsSkip}{12pt}

\newlength{\SDEWES@BetweenAuthorsSkip}
\setlength{\SDEWES@BetweenAuthorsSkip}{12pt}

\newlength{\SDEWES@AuthorsToAbstractSkip}
\setlength{\SDEWES@AuthorsToAbstractSkip}{24pt}

\newlength{\SDEWES@AbstractHeadingToTextSkip}
\setlength{\SDEWES@AbstractHeadingToTextSkip}{6pt}

\newlength{\SDEWES@AbstractToKeywordsSkip}
\setlength{\SDEWES@AbstractToKeywordsSkip}{12pt}

\newlength{\SDEWES@KeywordsHeadingToTextSkip}
\setlength{\SDEWES@KeywordsHeadingToTextSkip}{6pt}

\newlength{\SDEWES@KeywordsToSectionSkip}
\setlength{\SDEWES@KeywordsToSectionSkip}{0pt}

% authors
\newcommand{\papertitle}[1]{\gdef\@papertitle{#1}}
\gdef\@papertitle{}

\newcommand{\declareauthor}[4]{%
  \expandafter\gdef\csname @author#1\endcsname{#2}%
  \expandafter\gdef\csname @affiliation#1\endcsname{#3}%
  \expandafter\gdef\csname @email#1\endcsname{#4}%
}

\@for\n:=1,2,3,4,5,6,7,8,9,10\do{%
  \expandafter\gdef\csname @author\n\endcsname{}%
  \expandafter\gdef\csname @affiliation\n\endcsname{}%
  \expandafter\gdef\csname @email\n\endcsname{}%
}

% abstract & keywords
\newcommand{\paperabstract}[1]{\gdef\@paperabstract{#1}}
\gdef\@paperabstract{}

\newcommand{\paperkeywords}[1]{\gdef\@paperkeywords{#1}}
\gdef\@paperkeywords{}

% section headings
\titleformat{\section}
  {\NormalFont\bfseries}
  {}{0em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}

\titleformat{\subsection}
  {\NormalFont\bfseries}
  {}{0em}{}
\titlespacing*{\subsection}{0pt}{12pt}{3pt}

\titleformat{\subsubsection}[runin]
  {\NormalFont\itshape}
  {}{0pt}{\underline}
\titlespacing*{\subsubsection}{0pt}{6pt}{0.3em}

% title
\renewcommand{\maketitle}{%
  \thispagestyle{plain}

  \vspace*{\SDEWES@TitleTopExtra}

  \begin{center}
    {\TitleFont\@papertitle\par}
  \end{center}

  \vspace{\SDEWES@TitleToAuthorsSkip}

  \newif\ifFirstAuthor
  \FirstAuthortrue

  \@for\n:=1,2,3,4,5,6,7,8,9,10\do{%
    \expandafter\ifx\csname @author\n\endcsname\empty
    \else
      \ifFirstAuthor\FirstAuthorfalse
      \else \vspace{\SDEWES@BetweenAuthorsSkip}
      \fi

      {\centering\AuthorFont
        \csname @author\n\endcsname\\
        \csname @affiliation\n\endcsname%
        \expandafter\ifx\csname @email\n\endcsname\empty\else
          \\ e-mail: \csname @email\n\endcsname%
        \fi
        \par
      }
    \fi
  }

  \vspace{\SDEWES@AuthorsToAbstractSkip}

  \ifx\@paperabstract\empty\else
    \noindent{\NormalFont\bfseries ABSTRACT\par}
    \vspace{\SDEWES@AbstractHeadingToTextSkip}
    {\AbstractFont\@paperabstract\par}
    \vspace{\SDEWES@AbstractToKeywordsSkip}
  \fi

  \ifx\@paperkeywords\empty\else
    \noindent{\NormalFont\bfseries KEYWORDS\par}
    \vspace{\SDEWES@KeywordsHeadingToTextSkip}
    {\AbstractFont\@paperkeywords\par}
    \vspace{\SDEWES@KeywordsToSectionSkip}
  \fi
}

% captions
\captionsetup[figure]{
  font=normalsize,
  labelfont=normalfont,
  textfont=normalfont,
  justification=centering,
  skip=12pt
}

\captionsetup[table]{
  font=normalsize,
  labelfont=normalfont,
  textfont=normalfont,
  justification=centering,
  skip=12pt,
  position=above
}

% footnotes
\renewcommand{\footnotesize}{\fontsize{10}{12}\selectfont}

\renewcommand*{\@makefnmark}{\textsuperscript{\normalfont\thefootnote}}

\deffootnote{1em}{1em}{%
  \makebox[1em][l]{\@makefnmark}%
}

\interfootnotelinepenalty=10000

% math
\allowdisplaybreaks

% nomenclature
\setlength{\nomitemsep}{-\parsep}
\newlength{\nomgroupstartsep}
\setlength{\nomgroupstartsep}{6pt}
\newcommand{\nomenclheader}[1]{\item[\hspace*{-\itemindent}\itshape#1]{\ } \vspace{6pt}\par}

\renewcommand\nomgroup[1]{
 \itemsep\nomgroupstartsep
  \ifstrequal{#1}{A}{\nomenclheader{Abbreviation}}{
  \ifstrequal{#1}{E}{\nomenclheader{Latin symbols}}{
  \ifstrequal{#1}{G}{\nomenclheader{Greek symbols}}{
  \ifstrequal{#1}{O}{\nomenclheader{Operators}}{
  \ifstrequal{#1}{X}{\nomenclheader{Subscripts}}{
  \ifstrequal{#1}{Y}{\nomenclheader{Superscripts}}{}}}}}}
 \itemsep\nomitemsep
}

\renewcommand{\nomname}{NOMENCLATURE}

\endinput