\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Harvard Resume]

%-------------------------------------
% Define options
%-------------------------------------
\newif\if@harvardstyle
\newif\if@defaultstyle

\DeclareOption{harvard}{\@harvardstyletrue}
\DeclareOption{default}{\@defaultstyletrue}
\DeclareOption*{\@harvardstyletrue}

\ProcessOptions\relax

% Load base class
\LoadClass[letterpaper,11pt]{article}

%-------------------------------------
% Required Packages
%-------------------------------------
\RequirePackage[english]{babel}
\RequirePackage{blindtext}
\RequirePackage[empty]{fullpage}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome5}
\RequirePackage[T1]{fontenc}
\RequirePackage{forarray}
\RequirePackage{hyperref}
\RequirePackage{latexsym}
\RequirePackage{lipsum}
\RequirePackage{marvosym}
\RequirePackage{multicol}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{verbatim}
\RequirePackage{xcolor}

%-------------------------------------
% Font Options
%-------------------------------------
% sans-serif
% \usepackage[sfdefault]{FiraSans}
% \usepackage[sfdefault]{roboto}
% \usepackage[sfdefault]{noto-sans}
% \usepackage[default]{sourcesanspro}

% serif
% \usepackage{CormorantGaramond}
% \usepackage{charter}

% Times New Roman
\usepackage{mathptmx}

%-------------------------------------
% Hyperlink Global Setup
%-------------------------------------

\hypersetup{
    colorlinks=false,
    pdfborder={0 0 0},
}
%-------------------------------------
% Page Setup
%-------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\addtolength{\oddsidemargin}{-0.6in}
\addtolength{\evensidemargin}{-0.5in}
\addtolength{\textwidth}{1.19in}
\addtolength{\topmargin}{-.7in}
\addtolength{\textheight}{1.4in}

\setlength{\tabcolsep}{0in}
\setlength{\multicolsep}{-3.0pt}
\setlength{\columnsep}{-1pt}
\urlstyle{same}

\if@defaultstyle
  \titleformat{\section}{
    \vspace{-4pt}\raggedright\large\bfseries
  }{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]
\else
  \titleformat{\section}{
    \vspace{-4pt}\centering\large\bfseries
  }{}{0em}{}
\fi

\input{glyphtounicode}
\pdfgentounicode=1
\raggedbottom
\raggedright

\renewcommand\labelitemi{$\vcenter{\hbox{\tiny$\bullet$}}$}
\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

%-------------------------------------
% Basic Resume Building Blocks
%-------------------------------------
\newcommand{\resumeItem}[1]{
  \item\small{{#1 \vspace{-2pt}}}
}

\newcommand{\resumeSubItem}[1]{
  \resumeItem{#1}\vspace{-4pt}
}

\newcommand{\EducationStyle}[5]{
  \vspace{-2pt}\item
    \begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & {\small #2} \\
      {\small#3} & {\small #4} \\ 
      {\small#5}
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\EducationNoHighlightsStyle}[5]{
  \vspace{-2pt}\item
    \begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & {\small #2} \\
      {\small#3} & {\small #4}
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\ExperienceStyle}[4]{
  \vspace{-2pt}\item
    \begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & {\small #2} \\
      {\small#3} & {\small #4} \\
    \end{tabular*}\vspace{-10pt}
}

\newcommand{\ProjectStyle}[2]{
    \item
    \begin{tabular*}{1.001\textwidth}{l@{\extracolsep{\fill}}r}
      \small#1 & \textbf{\small #2}\\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\classesList}[4]{
    \item\small{
        {#1 #2 #3 #4 \vspace{-2pt}}
  }
}

%-------------------------------------
% Title Section Block
%-------------------------------------
\newcommand{\titlesection}{
\begingroup
\begin{center}
    {\Huge \scshape \firstname\ \lastname}\\
    \ifdefined\position
        {\small\textit{Applying For: \position}}\\
    \fi
    \vspace{6pt}
    \small
    \raisebox{-0.1\height}\faPhone\ \phone ~
    \href{mailto:\email}{\raisebox{-0.1\height}\faEnvelope\ \email}
    \href{https://\linkedin}{\raisebox{-0.1\height}\faLinkedin\ \linkedin} ~
    \href{https://\github}{\raisebox{-0\height}\faGithub\ \github}
    \\
    \ifdefined\address
        \href{https://www.google.com/maps/search/?api=1&query=\address}{\raisebox{-0\height}\faMapMarker\ \address}
    \fi
    \vspace{-8pt}
\end{center}
\endgroup
}

%-------------------------------------
% Template Definitions
%-------------------------------------
\newcommand{\Education}[9]{
  \DefineArrayVar{#1}{@}
  {|}{Start|End|University|Location|Degree|Concentration|GPA|Highlights}
  {|}{{#2}|{#3}|{#4}|{#5}|{#6}|{#7}|{#8}|{#9}}
}

\newcommand{\Experience}[7]{
  \DefineArrayVar{#1}{@}
  {|}{Start|End|Company|Position|Location|Highlights}
  {|}{{#2}|{#3}|{#4}|{#5}|{#6}|{#7}}
}

\newcommand{\Project}[5]{
  \DefineArrayVar{#1}{@}
  {|}{Date|ProjectName|Position|Highlights}
  {|}{{#2}|{#3}|{#4}|{#5}}
}

%-------------------------------------
% Content Renderers
%-------------------------------------
\newcommand{\renderEducation}[1]{
    \EducationStyle
      {\csname #1@University\endcsname}
      {\csname #1@Location\endcsname}
      {\csname #1@Degree\endcsname, \csname #1@Concentration\endcsname. \csname #1@GPA\endcsname}
      {\csname #1@Start\endcsname~--~\csname #1@End\endcsname}
      {\csname #1@Highlights\endcsname}
}

\newcommand{\renderEducationNoHighlights}[1]{
    \EducationNoHighlightsStyle
      {\csname #1@University\endcsname}
      {\csname #1@Location\endcsname}
      {\csname #1@Degree\endcsname, \csname #1@Concentration\endcsname. \csname #1@GPA\endcsname}
      {\csname #1@Start\endcsname~--~\csname #1@End\endcsname}
      {}
}

\newcommand{\renderExperience}[1]{
  \ExperienceStyle
    {\csname #1@Company\endcsname}{\csname #1@Location\endcsname}
    {\csname #1@Position\endcsname}{\csname #1@Start\endcsname~--~\csname #1@End\endcsname}
    \csname #1@Highlights\endcsname
}

\newcommand{\renderProject}[1]{
  \ProjectStyle
    {\textbf{\csname #1@ProjectName\endcsname} $|$ \csname #1@Position\endcsname}
    {\csname #1@Date\endcsname}
}

\newcommand{\describe}[2]{
  \csname #1@#2\endcsname
}

\newcommand{\link}[2]{\href{#1}{\textcolor{blue}{[#2]}}}

\newcommand{\updated}[1]{
  \fancyfoot[R]{\makebox[0pt][l]{\textcolor{gray}{\textit{\scriptsize Last updated: #1}}}}
}

%-------------------------------------
% Utility
%-------------------------------------
\def\sett#1#2#3{\expandafter\def\csname#1#2\endcsname{#3}}
