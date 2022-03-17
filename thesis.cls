%%
%% This "thesis.cls" file is a class file.
%% It provides you with definitions necessary to typeset
%% a thesis in the format required by the Graduate School
%% of Natural and Applied Sciences, Yeditepe University.
%%
%% File prepared by Osman Kerem Perente
%% <kperente@cse.yeditepe.edu.tr>
%%
%% Last modified on 22/02/2022
%%
%% Based on the original thesis template
%% prepared by Feza Kerestecioglu <kerestec@khas.edu.tr>
%% http://webprs.khas.edu.tr/~kerestec/fbe_tez.zip
%%
%% DO NOT CHANGE THIS FILE
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2022/02/22 FBE Thesis Class, Yeditepe University]

\typeout{FBE Thesis Class, Version 1.0}
\typeout{Prepared by Osman Kerem Perente}

% declare thesis class options
\DeclareOption{algpseudocode}{\global\let\@algorithm\@ne}
\DeclareOption{algorithm2e}{\global\let\@algorithm\tw@}
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

% thesis class is based on report class with 12pt
\LoadClass[a4paper,12pt]{report}

% load geometry, parskip, and setspace packages
\RequirePackage[a4paper]{geometry}
\RequirePackage[skip=10pt]{parskip}
\RequirePackage[singlespacing]{setspace}

% load algorithm packages according to the class options
\ifx\@algorithm\@ne
    \RequirePackage{algpseudocode}
\fi
\ifx\@algorithm\tw@
    \RequirePackage[algo2e]{algorithm2e}
    \SetKwInput{KwRequire}{Require}
    \SetNlSty{textbf}{}{:}
\fi

% load math related packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{isomath}
\RequirePackage{upgreek}

% load figure and table related packages
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{hhline}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{newfloat}

% load caption related packages
\RequirePackage{caption}
\RequirePackage{subcaption}

% load header and landscape related packages
\RequirePackage{fancyhdr}
\RequirePackage{pdflscape}

% footnote related packages
\RequirePackage{fnpct}
\RequirePackage[bottom]{footmisc}

% load font related packages
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxmath}
\RequirePackage{newtxtext}

\RequirePackage{listings}
\RequirePackage{xcolor}

% set paper margins
\geometry{%
    top             = 3.5cm,
    bottom          =   2cm,
    left            = 3.5cm,
    right           =   2cm,
    headheight      =   1cm,
    headsep         =   1cm,
    footskip        =   1cm,
    marginparsep    = .25cm,
    marginparwidth  = 1.5cm
}

% 1.5 line spacing is used in the document
\setstretch{1.5}

% set page numbering style up to the introduction chapter
\pagenumbering{roman}

% adjust page style
\fancypagestyle{mypagestyle}{
    \fancyhf{}
    \rhead{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% set page style
\pagestyle{mypagestyle}

% disable end of line hyphenation
\hyphenpenalty=\@M
\exhyphenpenalty=\@M

% allow more spacing between words
\tolerance=\@M

% set distance from top of page to first float
\setlength{\@fptop}{\z@}

% define an algorithm environment
\DeclareFloatingEnvironment[%
    fileext             = loa,%
    listname            = {List of Algorithms},%
    name                = Algorithm,%
    placement           = htbp,%
    within              = chapter,%
    chapterlistsgaps    = off%
    ]{algorithm}

% figure and table caption names
\renewcommand{\algorithmname}{Algorithm}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

% caption styling in list of algorithms, figures, and tables
\DeclareCaptionListFormat{algstyle}{\algorithmname\ #2.}
\DeclareCaptionListFormat{figstyle}{\figurename\ #2.}
\DeclareCaptionListFormat{tabstyle}{\tablename\ #2.}

% caption styling inside the text
\captionsetup{justification=centering,labelsep=period,subrefformat=parens}
\captionsetup[algorithm]{aboveskip=12pt,belowskip=20pt,listformat=algstyle}
\captionsetup[figure]{aboveskip=12pt,belowskip=8pt,listformat=figstyle}
\captionsetup[subfigure]{aboveskip=5pt,belowskip=5pt}
\captionsetup[table]{aboveskip=12pt,belowskip=20pt,listformat=tabstyle}

% table cell spacing adjustments
\renewcommand{\theadalign}{cc}
\renewcommand{\theadfont}{\bfseries}
\renewcommand{\theadgape}{\Gape[2pt]}
\renewcommand{\cellalign}{cc}
\renewcommand{\cellgape}{\Gape[2pt]}

% listing settings
\definecolor{listingbg}{rgb}{.95, .95, .95}
\lstset{
    frame               = single,
    keepspaces          = true,
    columns             = flexible,
    basicstyle          = {\footnotesize\ttfamily},
    escapeinside        = {(*<}{>*)},
    backgroundcolor     = \color{listingbg},
    showstringspaces    = false,
    language            = C,
    keywordstyle        = \color{blue},
    stringstyle         = \color{red},
    commentstyle        = \color{teal},
    numbers             = left,
    firstnumber         = 1,
    numberstyle         = \footnotesize\ttfamily,
    numbersep           = 7pt
}

% internal variables
\global\let\@appflag\empty

\global\let\@department\empty
\global\let\@studentnumber\empty

\global\def\@approvalskip{4cm}
\global\def\@signatureskip{8.5cm}

\global\let\@supervisor\empty
\global\let\@supervisoruni\empty
\global\let\@cosupervisori\empty
\global\let\@cosupervisoriuni\empty
\global\let\@cosupervisorii\empty
\global\let\@cosupervisoriiuni\empty
\global\let\@examineri\empty
\global\let\@examineriuni\empty
\global\let\@examinerii\empty
\global\let\@examineriiuni\empty
\global\let\@examineriii\empty
\global\let\@examineriiiuni\empty
\global\let\@examineriv\empty
\global\let\@examinerivuni\empty
\global\let\@examinerv\empty
\global\let\@examinervuni\empty

\global\let\@turkishtitle\empty

% external cover page commands
\newcommand{\department}[1]{%
    \global\def\@department{#1}%
}

\newcommand{\studentnumber}[1]{%
    \global\def\@studentnumber{#1}%
}

\newcommand{\approvalskip}[1]{%
    \global\def\@approvalskip{#1}%
}

\newcommand{\signatureskip}[1]{%
    \global\def\@signatureskip{#1}%
}

\newcommand{\supervisor}[2]{%
    \global\def\@supervisor{#1}%
    \global\def\@supervisoruni{#2}%
}

\newcommand{\cosupervisori}[2]{%
    \global\def\@cosupervisori{#1}%
    \global\def\@cosupervisoriuni{#2}%
}

\newcommand{\cosupervisorii}[2]{%
    \global\def\@cosupervisorii{#1}%
    \global\def\@cosupervisoriiuni{#2}%
}

\newcommand{\examineri}[2]{%
    \global\def\@examineri{#1}%
    \global\def\@examineriuni{#2}%
}

\newcommand{\examinerii}[2]{%
    \global\def\@examinerii{#1}%
    \global\def\@examineriiuni{#2}%
}

\newcommand{\examineriii}[2]{%
    \global\def\@examineriii{#1}%
    \global\def\@examineriiiuni{#2}%
}

\newcommand{\examineriv}[2]{%
    \global\def\@examineriv{#1}%
    \global\def\@examinerivuni{#2}%
}

\newcommand{\examinerv}[2]{%
    \global\def\@examinerv{#1}%
    \global\def\@examinervuni{#2}%
}

\newcommand{\turkishtitle}[1]{%
    \global\def\@turkishtitle{#1}%
}

% internal commands
\def\@subMSc{%
    Submitted to Graduate School of Natural and Applied Sciences\\
    in Partial Fulfillment of the Requirements\\
    for the Degree of Master of Science in\\
    \ifx\@department\empty
        \@@warning{No \string\department\space given}
    \else
        \@department\\
    \fi
}

\def\@subPhD{%
    Submitted to Graduate School of Natural and Applied Sciences\\
    in Partial Fulfillment of the Requirements\\
    for the Degree of Doctor of Philosophy in\\
    \ifx\@department\empty
        \@@warning{No \string\department\space given}
    \else
        \@department\\
    \fi
}

\def\@uptitle{%
    \MakeUppercase{\@title}\\
    \vskip 42ex
    by\\
    \@author\\
    \vskip 27ex
}

\def\@downtitle{%
    \par\vfill%
    Yeditepe University\\
    \@date\vspace{10pt}
}

\newcommand{\@MakeApprovalPage}{%
    \addtocounter{page}{1}
    \begin{center}
    \MakeUppercase{\@title}\par
    \end{center}
    \vskip \@approvalskip
    APPROVED BY:
    \vskip 1.5cm

    \begin{tabbing}
    \hspace{\@signatureskip} \= \kill
    \ifx\@supervisor\empty
        \ifx\@cosupervisori\empty
            \ifx\@cosupervisorii\empty
                \@@warning{No \string\supervisor\space given}
            \fi
        \fi
    \else
        \@supervisor \> \makebox[5.4cm]{\dotfill} \\
        (Thesis Supervisor) \\ (\@supervisoruni) \\ \\
    \fi
    \ifx\@cosupervisori\empty
    \else
        \@cosupervisori \> \makebox[5.4cm]{\dotfill} \\
        (Thesis Co-Supervisor) \\ (\@cosupervisoriuni) \\ \\
    \fi
    \ifx\@cosupervisorii\empty
    \else
        \@cosupervisorii \> \makebox[5.4cm]{\dotfill} \\
        (Thesis Co-Supervisor) \\ (\@cosupervisoriiuni) \\ \\
    \fi
    \ifx\@examineri\empty
    \else
        \@examineri \> \makebox[5.4cm]{\dotfill} \\
        (\@examineriuni) \\ \\
    \fi
    \ifx\@examinerii\empty
    \else
        \@examinerii \> \makebox[5.4cm]{\dotfill} \\
        (\@examineriiuni) \\ \\
    \fi
    \ifx\@examineriii\empty
    \else
        \@examineriii \> \makebox[5.4cm]{\dotfill} \\
        (\@examineriiiuni) \\ \\
    \fi
    \ifx\@examineriv\empty
    \else
        \@examineriv \> \makebox[5.4cm]{\dotfill} \\
        (\@examinerivuni) \\ \\
    \fi
    \ifx\@examinerv\empty
    \else
        \@examinerv \> \makebox[5.4cm]{\dotfill} \\
        (\@examinervuni) \\ \\
    \fi
    \end{tabbing}

    \vfill
    DATE OF APPROVAL:\hskip .5em ..../..../20....
    \vspace{10pt}
}

\newcommand{\@MakeDeclarationPage}{%
    \clearpage
    I hereby declare that this thesis is my own work and that all information in
    this thesis has been obtained and presented in accordance with academic
    rules and ethical conduct. I have fully cited and referenced all material
    and results as required by these rules and conduct, and this thesis study
    does not contain any plagiarism. If any material used in the thesis
    requires copyright, the necessary permissions have been obtained. No
    material from this thesis has been used for the award of another degree.

    I accept all kinds of legal liability that may arise in case contrary to
    these situations.

    \vskip 36pt

    \begin{tabbing}
    \hspace{5cm} \= \kill
    \> Name, Last Name \` \makebox[7cm]{\@author} \\
    \\
    \> Signature \` \makebox[7cm]{\dotfill} \\
    \end{tabbing}

    \vfill\null
}

\def\@beginsymlist{%
\begin{tabbing}
    \hspace{4cm} \= \kill
}

\def\@closesymlist{%
    \end{tabbing}
}

\def\@symdesc#1{
    \parbox[t]{11.4cm}{#1\par\vspace{4pt}}
}

% dotfill command redefinition
\renewcommand{\dotfill}{%
    \leavevmode
    \cleaders \hb@xt@ .25em{\hss.\hss}\hfill
    \kern\z@
}

% external commands
\newcommand{\MakeMScThesis}{%
    \begin{titlepage}
    \begin{center}
    \@uptitle
    \@subMSc
    \@downtitle
    \end{center}
    \end{titlepage}
    \@MakeApprovalPage
    \@MakeDeclarationPage
}

\newcommand{\MakePhDThesis}{%
    \begin{titlepage}
    \begin{center}
    \@uptitle
    \@subPhD
    \@downtitle
    \end{center}
    \end{titlepage}
    \@MakeApprovalPage
    \@MakeDeclarationPage
}

\newcommand{\MakePhDProposal}{{%
    \normalfont\normalsize\bfseries
    \begin{titlepage}
    \begin{center}
    YEDITEPE UNIVERSITY\\
    GRADUATE SCHOOL OF NATURAL AND APPLIED SCIENCES\\
    \vskip 25ex
    THESIS PROPOSAL\\
    \vskip 30ex
    \@author\\
    \ifx\@studentnumber\empty
        \@@warning{No \string\studentnumber\space given}
    \else
        \@studentnumber\\
    \fi
    \ifx\@department\empty
        \@@warning{No \string\department\space given}
    \else
        \@department\\
    \fi
    \par\vfill%
    \@date%
    \vskip 15ex
    \end{center}
    \end{titlepage}

    \addtocounter{page}{1}
    \begin{center}
    \MakeUppercase{\@title}\par
    \end{center}
    \vskip 7cm
    STEERING COMMITTEE:
    \vskip 1.5cm

    \begin{tabbing}
    \hspace{3cm} \= \hspace{2cm} \= \kill
    \ifx\@supervisor\empty
        \ifx\@cosupervisori\empty
            \ifx\@cosupervisorii\empty
                \@@warning{No \string\supervisor\space given}
            \fi
        \fi
    \else
        Thesis Advisor \> : \> \@supervisor \\
        \> \> \@supervisoruni \\ \\
    \fi
    \ifx\@cosupervisori\empty
    \else
        Co-Advisor \> : \> \@cosupervisori \\
        \> \> \@cosupervisoriuni \\ \\
    \fi
    \ifx\@cosupervisorii\empty
    \else
        Co-Advisor \> : \> \@cosupervisorii \\
        \> \> \@cosupervisoriiuni \\ \\
    \fi
    \ifx\@examineri\empty
    \else
        Member \> : \> \@examineri \\
        \> \> \@examineriuni \\ \\
    \fi
    \ifx\@examinerii\empty
    \else
        Member \> : \> \@examinerii \\
        \> \> \@examineriiuni \\ \\
    \fi
    \ifx\@examineriii\empty
    \else
        Member \> : \> \@examineriii \\
        \> \> \@examineriiiuni \\ \\
    \fi
    \ifx\@examineriv\empty
    \else
        Member \> : \> \@examineriv \\
        \> \> \@examinerivuni \\ \\
    \fi
    \ifx\@examinerv\empty
    \else
        Member \> : \> \@examinerv \\
        \> \> \@examinervuni \\ \\
    \fi
    \end{tabbing}

    \par\vfill\null
}}

\newcommand{\SymLine}[2]{#1 \> \@symdesc{#2} \\}

% chapter names
\def\ackname{Acknowledgements}
\def\forewordname{Foreword}
\def\prefacename{Preface}
\def\abstractname{Abstract}
\def\turkishabstractname{Özet}
\def\contentsname{Table of Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\listalgorithmname{List of Algorithms}
\def\listsymabbrename{List of Symbols/Abbreviations}
\def\bibname{References}
\def\appendixname{Appendix}

% external environments
\newenvironment{acknowledgements}{%
    \begin{center}
    \chapter*{\ackname}
    \end{center}
}{\par\vfill\null}

\newenvironment{foreword}{%
    \chapter*{\forewordname}
}{\par\vfill\null}

\newenvironment{preface}{%
    \chapter*{\prefacename}
}{\par\vfill\null}

\renewenvironment{abstract}{%
    \begin{center}
    \chapter*{\abstractname}
    {%
        \normalfont \interlinepenalty \@M%
        \normalsize \bfseries%
        \MakeUppercase{\@title}\par\nobreak%
    }%
    \end{center}
}{\par\vfill\null}

\newenvironment{turkishabstract}{%
    \begin{center}
    \chapter*{\turkishabstractname}
    \ifx\@turkishtitle\empty
        \@@warning{No \string\turkishtitle\space given}
    \else
    {%
        \uccode`\i='235%
        \lccode`\I='031%
        \normalfont \interlinepenalty \@M%
        \normalsize \bfseries%
        \MakeUppercase{\@turkishtitle}\par\nobreak%
    }%
    \fi
    \end{center}
}{\par\vfill\null}

\newenvironment{symbolsabbreviations}{%
    \chapter*{\listsymabbrename}
    \@beginsymlist
}{\@closesymlist}

% section and toc depth settings
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% dottedtocline redefinition
\def\@dottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth \else
    {%
        \leftskip #2\relax% \rightskip 3.5em\relax \parfillskip -\rightskip
        \parindent \z@\relax \@afterindenttrue
        \interlinepenalty \@M
        \leavevmode
        \@tempdima #3\relax
        {#4}\nobreak\dotfill #5\ifnum #1=-10 \vskip 10\p@\relax \fi \par%
    }%
    \fi
}

% table of contents dotted line settings
\renewcommand*\l@chapter{\@dottedtocline{0}{0em}{1.75em}}
\renewcommand*\l@section{\@dottedtocline{1}{0.75em}{2.5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{1.5em}{3.25em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{2.25em}{4em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{3em}{4.75em}}

% list of algorithms, figures, and tables dotted line settings
\renewcommand*\l@algorithm{\@dottedtocline{-10}{0em}{7em}}
\renewcommand*\l@figure{\@dottedtocline{-10}{0em}{5.35em}}
\renewcommand*\l@table{\@dottedtocline{-10}{0em}{5em}}

% settings related to chapter, section, subsection, etc.
\renewcommand{\chapter}{%
    \clearpage
    \global\@topnum\z@
    \@afterindenttrue
    \secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \ifx\@appflag\empty
            \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter.}%
                \texorpdfstring{\MakeUppercase{#1}}{#1}}%
        \else
            \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{%
                \appendixname}\ \thechapter}{\appendixname\ \thechapter}}%
        \fi
    \fi
    \chaptermark{#1}%
    \@makechapterhead{#2}%
    \@afterheading
}

\def\@makechapterhead#1{{%
    \parindent \z@ \raggedright \normalfont
    \interlinepenalty \@M
    \large \bfseries
    \ifnum \c@secnumdepth >\m@ne
        \ifx\@appflag\empty
            \thechapter .\hskip .5em\relax
        \else
            \MakeUppercase{\appendixname} \thechapter :\hskip .5em\relax
        \fi
    \fi
    \MakeUppercase{#1}\par\nobreak%
    \vskip 14\p@%
}}

\def\@schapter#1{%
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{#1}}{#1}}%
    \@makeschapterhead{#1}%
    \@afterheading
}

\def\@makeschapterhead#1{{%
    \parindent \z@ \normalfont
    \interlinepenalty \@M
    \large \bfseries
    \MakeUppercase{#1}\par\nobreak%
    \vskip 14\p@%
}}

\def\@sect#1#2#3#4#5#6[#7]#8{%
    \ifnum #2>\c@secnumdepth
        \let\@svsec\@empty
    \else
        \refstepcounter{#1}%
        \protected@edef\@svsec{\csname the#1\endcsname.\hskip .5em\relax}%
    \fi
    \@tempskipa #5\relax
    \ifdim \@tempskipa >\z@
        \begingroup
        #6%
        {%
            \@hangfrom{\hskip #3\relax\@svsec}%
            \interlinepenalty \@M
            \ifnum #2=1 \MakeUppercase{#8}\else #8\fi
            \@@par%
        }%
        \endgroup
        \csname #1mark\endcsname{#7}%
        \addcontentsline{toc}{#1}{%
            \ifnum #2>\c@secnumdepth \else
                \protect\numberline{\csname the#1\endcsname.}%
            \fi
            \ifnum #2=1 \texorpdfstring{\MakeUppercase{#7}}{#7}%
            \else #7%
            \fi}%
    \else
        \def\@svsechd{%
            #6%
            {%
                \hskip #3\relax
                \@svsec \ifnum #2=1 \MakeUppercase{#8}\else #8\fi
            }%
            \csname #1mark\endcsname{#7}%
            \addcontentsline{toc}{#1}{%
                \ifnum #2>\c@secnumdepth \else
                    \protect\numberline{\csname the#1\endcsname.}%
                \fi
                \ifnum #2=1 \texorpdfstring{\MakeUppercase{#7}}{#7}%
                \else #7%
                \fi}%
        }%
    \fi
    \@xsect{#5}%
}

\renewcommand{\section}{%
    \@startsection{section}%
        {1}%
        {\z@}%
        {24\p@}%
        {24\p@}%
        {\raggedright\normalfont\normalsize\bfseries}%
}

\renewcommand{\subsection}{%
    \@startsection{subsection}%
        {2}%
        {\z@}%
        {24\p@}%
        {24\p@}%
        {\raggedright\normalfont\normalsize\bfseries}%
}

\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}%
        {3}%
        {\z@}%
        {10\p@}%
        {10\p@}%
        {\raggedright\normalfont\normalsize\bfseries\itshape}%
}

\renewcommand{\paragraph}{%
    \@startsection{paragraph}%
        {4}%
        {\z@}%
        {10\p@}%
        {10\p@}%
        {\raggedright\normalfont\normalsize\bfseries}%
}

% bibliography settings
\def\@biblabel#1{#1.}

\def\@citex[#1]#2{%
    \leavevmode
    \let\@citea\@empty
    \@cite{%
        \@for\@citeb:=#2\do{%
            \@citea\def\@citea{,\penalty\@M}%
            \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
            \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
            \@ifundefined{b@\@citeb}{\hbox{\reset@font\bfseries ?}%
            \G@refundefinedtrue
            \@latex@warning
                {Citation `\@citeb' on page \thepage \space undefined}}%
                {\@cite@ofmt{\csname b@\@citeb\endcsname}}%
        }%
    }{#1}%
}

% appendix settings
\renewcommand{\appendix}{%
    \par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \global\def\@chapapp{\appendixname}%
    \global\def\thechapter{\@Alph\c@chapter}%
    \let\@appflag\@ne
}

% footnote numbers does not reset each chapter
\counterwithout{footnote}{chapter}
\setcounter{footnote}{0}

% footnote rule adjustments
\renewcommand{\footnoterule}{%
    \kern -3\p@
    \hrule \@width 5cm \@height .4\p@
    \kern 2.6\p@
}

% footnote text adjustments
\renewcommand{\@makefntext}[1]{%
    \parindent \z@%
    \noindent \hb@xt@ 1cm{\hss\@makefnmark\ }#1%
}

% the size required in quotations is 10pt
% adjusted 1cm spacing from left and right margins
\renewenvironment{quote}{
    \normalfont \footnotesize
    \list{}{\rightmargin=1cm \leftmargin=1cm}
    \item \relax
}{\endlist}

% hyperref & cleveref must be loaded at the very end
\RequirePackage[hidelinks,linktoc=all]{hyperref}
\RequirePackage[capitalize,nameinlink,noabbrev]{cleveref}

%%
%% End of "thesis.cls" file
%%