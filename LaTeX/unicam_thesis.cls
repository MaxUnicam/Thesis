
% -----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unicam_thesis}[2010/06/30 - LaTeX class for composing thesis at 
                  University of Camerino - School of Science ant Technologies]
% -----------------------------------------------------------------------------

\newcommand{\@ptoption}{1pt}
\newcommand{\@tipo}{oneside}
\ExecuteOptions{oneside,12pt}
\ProcessOptions\relax
\typeout{*************************************************************************}
\typeout{****** Document Class 'unicam_thesis' <June 30, 2010> *******************}
\typeout{****** Please report bugs, comments, suggestions, and improvements ******}
\typeout{****** to Andrea Polini <andrea.polini@unicam.it> ***********************}
\typeout{****** or Francesco De Angelis <francesco.deangelis@unicam.it> **********}
\typeout{*************************************************************************}
% -----------------------------------------------------------------------------
% Load the book class for a4 paper dimension
% -----------------------------------------------------------------------------
\LoadClass[\@tipo,a4paper,1\@ptoption]{book}

% -----------------------------------------------------------------------------
% Load support packages
%
% Get the missing packages at ftp://ftp.dante.de/tex-archive
% -----------------------------------------------------------------------------

% set page geometry
\RequirePackage[top=3cm, bottom=3cm, inner=3.5cm, outer=3cm]{geometry}%

% italian character set
\RequirePackage[utf8x]{inputenc}%

\RequirePackage{graphicx}%
\RequirePackage{makeidx}%
\RequirePackage{wrapfig}%
\RequirePackage[metapost]{mfpic}%
\RequirePackage{arydshln}%
\RequirePackage{amssymb}%
\RequirePackage{amsmath}%
\RequirePackage{amsthm}%
\RequirePackage[pdftex,bookmarks=true,colorlinks=true,citecolor=cyan,urlcolor=blue,linkcolor=black]{hyperref}%
\RequirePackage{subfigure}%
\RequirePackage{xspace}%
\RequirePackage{array}%
\RequirePackage{times}%
\RequirePackage{fancyhdr}%
\usepackage{amssymb} 
\usepackage{tikz}
\usetikzlibrary{positioning}
%\usetikzlibrary{arrows,shapes,plotmarks,trees}

\tikzset{set/.style={draw,circle,inner sep=0pt,align=center}}



% \RequirePackage{helvet}
\renewcommand{\familydefault}{\rmdefault}
\renewcommand{\rmdefault}{cmr}

\makeindex %
\date{} %

\RequirePackage[italian]{varioref}
\RequirePackage[italian]{babel}
\RequirePackage{colortbl}

\RequirePackage[final]{listings}
\definecolor{listingsBackground}{rgb}{0.9,0.9,0.9}
\lstdefinestyle{xmlCode}{language=XML,frame=tbrl,
  basicstyle=\scriptsize\ttfamily,keywordstyle=\ttfamily\bf,
  stringstyle=\itshape,flexiblecolumns=true,
  commentstyle=\itshape,captionpos=b,abovecaptionskip=10pt,belowcaptionskip=0pt,
  backgroundcolor=\color{listingsBackground}, frame=none
, numbers=left, numberstyle={\tiny }
}
\lstdefinestyle{javaCode}{language=Java,frame=tbrl,
  basicstyle=\scriptsize\ttfamily,keywordstyle=\ttfamily\bf,
  stringstyle=\itshape,flexiblecolumns=true,
  commentstyle=\itshape,captionpos=b,abovecaptionskip=10pt,belowcaptionskip=0pt,
  backgroundcolor=\color{listingsBackground}, frame=none, 
  numbers=left, numberstyle={\tiny }
}

% ---------------------------------------------------------------------------
% --- Numbering
% ---------------------------------------------------------------------------
\setcounter{secnumdepth}{3}

% ---------------------------------------------------------------------------
% --- Empty pages...
% ---------------------------------------------------------------------------

\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage


% ---------------------------------------------------------------------------
% --- FRONTPAGE
% ---------------------------------------------------------------------------
\newcommand{\mychaptertitlefont}{\fontseries{s}\fontsize{20}{24}\selectfont}
\newcommand{\mytitlefont}{\fontseries{b}\sc\fontsize{15}{24}\selectfont}
\newcommand{\mysubtitlefont}{\fontseries{s}\fontsize{13}{16}\selectfont}
\newcommand{\authorfont}{\fontseries{s}\fontsize{14}{14}\selectfont}
\newcommand{\largefont}{\fontseries{s}\fontsize{18}{14}\selectfont}
\newcommand{\bigfont}{\fontseries{s}\fontsize{20}{14}\selectfont}
\newcommand{\biggerfont}{\fontseries{s}\fontsize{26}{22}\selectfont}

\def\author#1{\gdef\@theauthor{#1}}
\def\university#1{\gdef\@theuniversity{#1}}
\def\school#1{\gdef\@theschool{#1}}
\def\course#1{\gdef\@thecourse{#1}}
\def\advisor#1{\gdef\@theadvisor{#1}}
\def\secondadvisor#1{\gdef\@thesecondadvisor{#1}}
\global\let\@thesecondadvisor\@empty
\def\thirdadvisor#1{\gdef\@thethirdadvisor{#1}}
\global\let\@thethirdadvisor\@empty
\def\academicyear#1{\gdef\@theacademicyear{#1}}
\def\matricola#1{\gdef\@thematricola{#1}}

\def\title#1{\gdef\@thetitle{#1}}
\def\subtitle#1{\gdef\@thesubtitle{#1}}

\def\deliverabletype#1{\gdef\@thedeliverabletype{#1}}
\def\deliverableno#1{\gdef\@thedeliverableno{#1}}
\def\naturedeliverable#1{\gdef\@thenaturedeliverable{#1}}
\def\disseminationlevel#1{\gdef\@thedisseminationlevel{#1}}
\def\internalno#1{\gdef\@theinternalno{#1}}
\def\contractualdeliverydate#1{\gdef\@thecontractualdeliverydate{#1}}
\def\actualdeliverydate#1{\gdef\@theactualdeliverydate{#1}}
\def\contributingwp#1{\gdef\@thecontributingwp{#1}}
\def\editors#1{\gdef\@theeditors{#1}}
\def\reviewers#1{\gdef\@thereviewers{#1}}

\def\@theauthors{}
\def\@thetitle{}
\def\@thesubtitle{}

\newcommand{\HRule}{\rule{\linewidth}{0pt}}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
%\enlargethispage{4\baselineskip}
\setlength{\parindent}{0mm}
\setlength{\parskip}{0mm}

\begin{center}
  {\rmfamily \Large \bfseries \@theuniversity \par}%
  \vspace{0.15cm}%
  \hrule%
  \vspace{0.15cm}%
  {\rmfamily \Large \scshape Scuola di \@theschool \par}%
  \vspace{0.15cm}%
  {\rmfamily \large Corso di \@thecourse \par}%
  \vspace{1cm}%
  \includegraphics[width=2.5cm]{images/unicam}\par%
  \vspace*{\stretch{7}}%
  {\rmfamily \LARGE \bfseries \@thetitle \par}%
  \vspace*{\stretch{7}}%
  {Studente \hfill Relatrice \par}%
  {\bfseries \large \@theauthor \hfill \@theadvisor \par}%
  % {\bfseries \small Matricola \@thematricola \hfill}%
% Secondo advisor se esiste
  \vspace{1cm}%
  \ifx\@thesecondadvisor\@empty
  \relax
  \else
  {\hfill Co-Relatore \par}%
  {\bfseries \large \hfill \@thesecondadvisor \par}%
  \fi
% Terzo advisor se esiste
  \vspace{1.5cm}%
  \ifx\@thethirdadvisor\@empty
  \relax
  \else
  {\hfill Secondo Correlatore \par}%
  {\bfseries \large \hfill \@thethirdadvisor \par}%
  \fi
%
  \vspace*{\stretch{7}}%
  \hrule%
  \vspace{0.15cm}%
  {\large A.A. \@theacademicyear}%
\end{center}

\newpage
\setlength{\parindent}{1em}
\setlength{\parskip}{2pt}
\cleardoublepage
}



% ---------------------------------------------------------------------------
%    Headers
% ---------------------------------------------------------------------------


% ---------------------------------------------------------------------------
% --- MISC COMMANDS
% ---------------------------------------------------------------------------

\def\date#1{\gdef\@thedate{#1}}

% \newcommand{\comment}[2]{}
\newcommand{\comment}[2]{\marginpar{\textcolor{red}{\ding{74}}}\footnote{\textcolor{red}{\it\scriptsize {\textbf{\sf \underline{#1}:~}#2}}}}



\newcommand{\abstract}[1]{
\newpage
\noindent
\fbox{\parbox{.98\linewidth}{
\vspace{-5mm}
\section*{Abstract}
\par
#1
}}\\[1cm]}
\newcommand{\keywords}[1]{
\noindent\fbox{\parbox{.98\linewidth}{
\vspace{-5mm}
\section*{Keyword List }
\par
#1
}}
}

\setlength{\baselineskip}{17pt}

 



\newcommand{\historyitem}[3]{
#1 & #2 & #3 \\ \hline
}
\newenvironment{history}
{
\newpage
\section*{Document History}
\begin{tabular}{|p{20mm}|p{82mm}|p{40mm}|}
\hline 
\textbf{Version} &  \textbf{Type of change}  & \textbf{Author(s)} \\
\hline
}
{
\end{tabular}
}
\newcommand{\reviewitem}[4]{
#1 & #2 & #3 & #4 \\ \hline
}
\newenvironment{review}
{
\newpage
\section*{Document Reviews}
\begin{tabular}{|p{22mm}|p{20mm}|p{33mm}|p{63mm}|}
\hline 
\textbf{Date} & \textbf{Version} & \textbf{Reviewer} & \textbf{Comment} \\
\hline
}
{
\end{tabular}
}
\newcommand{\acronym}[2]{
#1 & #2 \\ \hline
}
\newenvironment{acronyms}
{
\newpage
\chapter*{Table of Acronyms}
\addcontentsline{toc}{chapter}{Table of Acronyms}
\begin{tabular}{|>{\centering}p{41mm}|p{106mm}|}
\hline
\textbf{Acronym} & \textbf{Expanded Version} \\
\hline
}
{
\end{tabular}
}



\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont 
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \Huge \bfseries % \@chapapp\space
         \thechapter .  #1\par\nobreak
%        \par\nobreak
%        \vskip 20\p@
%      \fi
%    \fi
%    \interlinepenalty\@M
%    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}