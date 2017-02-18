%
% $Source: /home/lapcvs/courses/latex-template/course.cls,v $
%
% $Author: stefanov $
% $Date: 2013/09/19 18:36:07 $
% $Revision: 1.55 $
%
% $Log: course.cls,v $
% Revision 1.55  2013/09/19 18:36:07  stefanov
% Update course.cls.
%
% Revision 1.35  2012/10/11 15:21:31  bayrak
% *** empty log message ***
%
% Revision 1.34  2011/11/09 12:58:26  bayrak
% *** empty log message ***
%
% Revision 1.33  2011/11/09 12:47:56  bayrak
% *** empty log message ***
%
% Revision 1.32  2011/05/05 13:28:25  xjimenez
% Add some registers in Nios 2.
% Modified sectionning of exam.
%
% Revision 1.31  2011/01/06 11:27:40  xjimenez
% Improved exam sectioning.
%
% Revision 1.30  2010/10/11 13:30:25  xjimenez
% - Gave a name to each exercise
%
% Revision 1.29  2010/10/11 07:26:30  xjimenez
% fixed exercise section (newpage -> clearpage)
%
% Revision 1.28  2010/09/21 13:34:59  xjimenez
% added PDF bookmarks for labs as well.
%
% Revision 1.27  2010/08/17 08:50:11  mpbraend
% Adding exercise book Archord II
%
% Revision 1.25  2009/12/04 17:32:34  xjimenez
% introduced pdf bookmarks
%
% Revision 1.24  2009/11/08 22:38:15  skhan
% *** empty log message ***
%
% Revision 1.23  2009/10/01 09:38:21  xjimenez
% Font size options are now passed to article.cls.
%
% Revision 1.22  2009/09/29 15:55:07  xjimenez
% Cleaned. Gate level simulation removed.
%
% Revision 1.21  2009/09/16 12:49:00  munoz
% Minor updates
%
% Revision 1.20  2009/08/26 12:56:23  munoz
% MIPS: added instruction not and xmuli
%
% Revision 1.19  2009/08/24 12:26:14  skhan
% *** empty log message ***
%
% Revision 1.18  2009/08/24 12:09:07  munoz
% Add comment char (#) for MIPS code
%
% Revision 1.17  2009/08/24 11:45:34  munoz
% Added MIPS command for lstlistings
%
% Revision 1.16  2009/07/27 07:27:36  skhan
% Class file updated
%
% Revision 1.15  2009/07/23 13:41:50  skhan
% *** empty log message ***
%
% Revision 1.14  2009/07/23 11:34:14  skhan
% *** empty log message ***
%
% Revision 1.13  2009/07/22 14:14:45  skhan
% class modifications for tables and floating figures
%
% Revision 1.12  2009/07/21 14:36:52  skhan
% Added Exercice 1
%
% Revision 1.11  2009/07/21 13:08:30  skhan
% Basic style added for Exercice Book in the Course class
%
% Revision 1.10  2009/05/07 12:46:58  xjimenez
% Minor edit
%
% Revision 1.9  2008/12/09 15:44:52  xjimenez
% Definition of some MACRO to switch easily between VHDL and Nios2 formatting.
% Minor edits.
%
% Revision 1.8  2008/10/21 14:57:14  xjimenez
% *** empty log message ***
%
% Revision 1.7  2008/02/26 09:23:09  xjimenez
% lab and exam option cleaned. Now option exam will select french and option lab british.
%
%
%=============================================================================
\ProvidesClass{course}[2009/10/01 v1.0 EPFL-IC-ISIM-LAP exercises/exam/labs]
%=============================================================================
%
% Options
%
% Options inherited from article.cls
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}

% Our options
\newif\if@lab   \@labfalse
\DeclareOption{lab}{\@labtrue}

\newif\if@exam  \@examfalse
\DeclareOption{exam}{\@examtrue}

\newif\if@book  \@bookfalse
\DeclareOption{book}{\@booktrue}

\newif\if@solution  \@solutionfalse
\DeclareOption{solution}{\@solutiontrue}

\DeclareOption*{} % undefined options

\ProcessOptions
\LoadClass[a4paper,twoside]{article}

%=============================================================================
\RequirePackage{graphicx}
\graphicspath{{figs/}}
\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage[latin1]{inputenc}
\if@lab
  \RequirePackage[british]{babel}
  \usepackage[backref,hypertexnames=false]{hyperref}
\fi
\if@exam
  \RequirePackage[french]{babel}
\fi
\if@book
  \RequirePackage[british]{babel}
  \usepackage{noindent}
  \usepackage{placeins}
  \usepackage{ulem}%barrer du texte\ProcessOptions
  \usepackage{float}
  \usepackage[backref,hypertexnames=false]{hyperref}%pdf
  \usepackage{subfigure}
  \usepackage{algorithmic}
  \usepackage[ruled]{algorithm}
\fi

%
\newcommand{\classloaded}{}

\RequirePackage{palatino}
\RequirePackage{helvet}
\RequirePackage[nofancy]{rcsinfo}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{textcomp}
\RequirePackage{color}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage{ctable}
\RequirePackage{array}

%=============================================================================
\rcsInfo $Id: course.cls,v 1.55 2013/09/19 18:36:07 stefanov Exp $
\newcommand{\@myspc}{ }
\ProvidesClass{course}[\rcsInfoDate\@myspc v\rcsInfoRevision\@myspc (P. Ienne)]
\let\courseRevision\rcsInfoRevision

%=============================================================================
%
% Page sizes from smallmrg.sty
%
\newlength{\@hrzmrg}
\setlength{\@hrzmrg}{2.5cm}

\newlength{\@vrtmrg}
\setlength{\@vrtmrg}{2.5cm}

\setlength{\oddsidemargin}{\@hrzmrg}
\addtolength{\oddsidemargin}{-1in}
\newlength{\@mrgtempdim}
\setlength{\@mrgtempdim}{\paperwidth}
\addtolength{\@mrgtempdim}{-2in}
\addtolength{\@mrgtempdim}{-2\oddsidemargin}
\setlength\textwidth       {\@mrgtempdim}
\setlength\evensidemargin  {\oddsidemargin}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2\@vrtmrg}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}     % this might be wrong!
\setlength{\topmargin}{\@vrtmrg}
\addtolength{\topmargin}{-1in}
\@settopoint\topmargin

%=============================================================================
%
% Headers
%
\newcommand{\headerstyle}[1]{{\small\sf #1}}
%=============================================================================
% Lab Header
\if@lab
  \fancypagestyle{title}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      Version \rcsInfoRevision\ of \rcsInfoLongDate, 
      EPFL \copyright \rcsInfoYear}}
    \fancyfoot[RO,LE]{\headerstyle{%
    \thepage\ of \pageref{LastPage}}}
  }
  \fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyhead[RO,LE]{\headerstyle{%
      \@title}}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      Version \rcsInfoRevision\ of \rcsInfoLongDate, 
      EPFL \copyright \rcsInfoYear}}
    \fancyfoot[RO,LE]{\headerstyle{%
    \thepage\ of \pageref{LastPage}}}
  }
\fi
%=============================================================================
% Exam Header
\if@exam
  \fancypagestyle{title}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      \@subtitle}}
    \fancyfoot[RO,LE]{\headerstyle{%
      \thepage\ de \pageref{LastPage}}}
  }
  \fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyhead[RO,LE]{\headerstyle{%
      \@title}}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      \@subtitle}}
    \fancyfoot[RO,LE]{\headerstyle{%
      \thepage\ de \pageref{LastPage}}}
  }
\fi

%=============================================================================
% Book Header
\if@book
  \fancypagestyle{title}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      Version \rcsInfoRevision\ of \rcsInfoLongDate, 
      EPFL \copyright \rcsInfoYear}}
    \fancyfoot[RO,LE]{\headerstyle{%
    \thepage\ of \pageref{LastPage}}}
  }
  \fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyhead{}
    \fancyhead[RO,LE]{\headerstyle{%
      \@mytitle \\ \@subtitle}}
    \fancyhead[LO,RE]{\headerstyle{\@type\ \arabic{exercise} \\ \@chapter}}
    \fancyfoot{}
    \fancyfoot[LO,RE]{\headerstyle{%
      Version \rcsInfoRevision\ of \rcsInfoLongDate, 
      EPFL \copyright \rcsInfoYear}}
    \fancyfoot[RO,LE]{\headerstyle{%
    \thepage\ of \pageref{LastPage}}}
  }
\fi

\pagestyle{plain}
%=============================================================================
%
% Title
%
\global\let\author\relax
\global\let\date\relax
%=============================================================================
% Lab title
\if@lab
  \def\subtitle#1{\gdef\@subtitle{#1}}
  \def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}
  \def\requirements#1{\gdef\@requirements{#1}}
  \def\@requirements{\@latex@error{No \noexpand\requirements given}\@ehc}
  \def\learninggoal#1{\gdef\@learninggoal{#1}}
  \def\@learninggoal{}
  \def\createdby#1{\gdef\@createdby{#1}}
  \def\@createdby{}
  \def\modifiedby#1{\gdef\@modifiedby{#1}}
  \def\@modifiedby{}
        
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                  \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \thispagestyle{title}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@requirements\@empty
    \global\let\@learninggoal\@empty
    \global\let\@createdby\@empty
    \global\let\@modifiedby\@empty
    \global\let\title\relax
    \global\let\subtitle\relax
    \global\let\subtitle\relax
    \global\let\requirements\relax
    \global\let\learninggoal\relax
    \global\let\createdby\relax
    \global\let\modifiedby\relax
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage
    \null
%    \vspace*{-2cm}
    \noindent {\Huge \textbf{\textsf{\@title}} \par}%
    \vskip 1.5em%
    \noindent {\normalfont \textsf{\@subtitle} \par}%
    \vskip .5em%
    \noindent\rule{\textwidth}{0.4pt}%
    \vskip 1.5em%
    \noindent {\normalfont \textsf{\textbf{Learning Goal:} \@learninggoal} \par}%
    \vskip 1em%
    \ifx\@requirements\@empty \else
    {%
      \noindent {\normalfont \textsf{\textbf{Requirements:} \@requirements} \par}%
      \vskip 1em%
    }
    \fi
    \ifx\@createdby\@empty \else
    {%
      \noindent {\normalfont \textsf{\textbf{Created by:} \@createdby} \par}%
      \vskip 1em%
    }
    \fi
    \ifx\@modifiedby\@empty \else
    {%
      \noindent {\normalfont \textsf{\textbf{Modified by:} \@modifiedby} \par}%
      \vskip 1em%
    }
    \fi
    \noindent\rule{\textwidth}{2pt}%
    \vskip 3em%
  }
\fi
%=============================================================================
% Exam title
\if@exam
  \def\subtitle#1{\gdef\@subtitle{#1}}
  \def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc} 
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \thispagestyle{title}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    % \global\let\@title\@empty     % keep it for the header
    % \global\let\@subtitle\@empty  % keep it for the header
    \global\let\@requirements\@empty
    \global\let\@learninggoal\@empty
    \global\let\@createdby\@empty
    \global\let\@modifiedby\@empty
    \global\let\title\relax
    \global\let\subtitle\relax
    \global\let\subtitle\relax
    \global\let\requirements\relax
    \global\let\learninggoal\relax
    \global\let\createdby\relax
    \global\let\modifiedby\relax
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage
    \null
    \noindent {\Huge \textbf{\textsf{\@title}} \par}%
    \vskip 1.5em%
    \noindent {\normalfont \textsf{\@subtitle} \par}%
    \vskip .5em%
    \noindent\rule{\textwidth}{0.4pt}%
    \vskip 1em%
    \noindent {\normalfont \textsf{
    \textit{Informations et consignes générales :}
    \begin{itemize}
      \item Le test dure exactement 2 heures.
      \item Répondez pour chaque exercice sur des feuilles séparées.
      \item Mettez votre nom et prénom sur toute feuille rendue.
    \end{itemize}} \par}%
    \vskip 1em%
    \noindent\rule{\textwidth}{2pt}%
    \vskip 3em%
  }
\fi

%=============================================================================
% Book title
\if@book
	\def\title#1{\gdef\@mytitle{#1}\gdef\@title{#1}}%very ugly hack (as \@title not accessible in the header)
  \def\subtitle#1{\gdef\@subtitle{#1}}
  
  \def\@maketitle{%
  	
    \newpage
    \null
    \thispagestyle{empty}
    %\noindent {\Huge \textbf{\textsf{\@title}} \par}%
    
    \begin{center}
			\large
			\includegraphics[width=6cm]{figs/EPFL_logo.pdf}
			\\
			\vspace{2cm}
			\Huge \textbf{\textsf{\@title}} \par%
			\vspace{1.5cm}
			
			\Large \textbf{\textsf{\@subtitle}}%
			
			\vspace{2cm}
			\@date
			
			\vspace{2cm}
			\normalsize
			Paolo \textsc{Ienne}, Xavier \textsc{Jimenez}, et al.  \\
			\vspace{0.7cm}
			\includegraphics[width=2cm]{figs/logo_lap.png}
		\end{center}
    \newpage
    
}
\fi
%=============================================================================
%
% Sectioning
%
%=============================================================================
% Lab sectioning
\if@lab
  \renewcommand{\section}{%
    \@startsection {section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\normalfont\Large\bfseries\sffamily}}
  \renewcommand{\subsection}{%
    \@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\large\bfseries\sffamily}
  }
\fi
%=============================================================================
% Exam sectioning
\if@exam
  \newcounter{exercise}%counter to number the exercise
  \newcounter{question}%counter to number the questions within an exercise
%
	\newcommand{\exercise}[1]{
		\ifnum\value{exercise}>0 \newpage%
		\fi%
		\refstepcounter{exercise}%
		\vspace{0.3cm}%
		{\noindent\normalfont\Large\bfseries\sffamily Exercice \arabic{exercise} : #1}%
		\vspace{0.5cm}%
		\\%
		\setcounter{question}{0}%reset the question counter for each new exercise
		\setcounter{equation}{0}
	}
	
	\newcommand{\question}{
		\refstepcounter{question}%
		\vspace{0.3cm}%
		{\noindent\normalfont\normalsize\bfseries\sffamily\alph{question})}
	}
	
	\renewcommand{\thequestion}{{\normalfont\normalsize\bfseries\sffamily\alph{question})}}
	
  \renewcommand{\section}{%
    \@startsection {section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\noindent\normalfont\Large\bfseries\sffamily}}
\fi
%=============================================================================
% Book sectioning
\if@book

		\newcounter{chapter}%counter that keeps track of the chapter numbering
		\newcounter{exercise}[chapter]%counter to number exercises. It is reset whenever exercise is incremented
%		
		\newcounter{question}%counter to number the questions within an exercise as well as answers in the solution
		\newcounter{subquestion}[question]%subquestion numbering, is reset for each new question
%		
	\newcommand{\exercise}[1]{
		\ifnum\value{exercise}>0 \clearpage%
		\fi%
		\refstepcounter{exercise}%
		\pdfbookmark[2]{Exercise \arabic{exercise} #1}{ch\arabic{chapter}:ex\arabic{exercise}}%
		\def\@type{Exercise}%
		\vspace{0.3cm}%
		\noindent%
		{\normalfont\large\bfseries\sffamily  [Exercise \arabic{exercise}] #1}%newline
		
		\vspace{0.5cm}
		\setcounter{question}{0}%reset the question counter for each new exercise
		\setcounter{equation}{0}
	}
%	
	\newcommand{\solution}[1]{
		\clearpage%
		\def\@type{Solution}%
		\noindent%
		{\normalfont\large\bfseries\sffamily [Solution \arabic{exercise}] #1}%newline
		
		\vspace{0.5cm}%
		\setcounter{question}{0}%
	}
%
	\newcommand{\question}{
		\refstepcounter{question}%
		{\noindent\normalfont\normalsize\bfseries\sffamily\alph{question})}
	}
%
	\newcommand{\subquestion}{
		\refstepcounter{subquestion}%
		{\noindent\normalfont\normalsize\bfseries\sffamily\roman{subquestion})}
	}
%

	\newcommand{\chapter}[1]{
		\newpage%
		\noindent%
		\refstepcounter{chapter}%
		\pdfbookmark[1]{Chapter \Roman{chapter} - #1}{ch\arabic{chapter}}%
		\def\@chapter{#1}%
		{\normalfont\Huge\bfseries\sffamily Part \Roman{chapter}: #1}\\%
		\noindent\rule{\textwidth}{1pt}%
		\vskip 1em
	}
%
  \newcommand{\inputex}[1]{
		\graphicspath{{#1/figs/}}
		\input{#1/exercise}
		\if@solution
		\input{#1/solution}
		\fi
	}
	
\fi
%=============================================================================

%=============================================================================
%
% Custom font and style definitions
%
\newcommand{\textstage}[1]{{\sffamily\bfseries #1}} % pipeline stage
\newcommand{\textsig}[1]{{\sffamily\bfseries #1}} % signal name
\newcommand{\textmenu}[1]{{\sffamily\fontseries{mc}\selectfont #1}} % windowing menu
\newcommand{\menusep}{$>$}
\newcommand{\textinstr}[1]{\lstinline{#1}} % processor instruction
\newcommand{\textreg}[1]{{\sffamily\slshape #1}} % processor register
\newenvironment{code}{\begin{quote}}{\end{quote}}
%
%Custom table style
\newcolumntype {+}{ >{\global \let \currentrowstyle \relax }}
\newcolumntype {^}{ >{\currentrowstyle }}

\newcommand {\rowstyle}[1]{
	\gdef \currentrowstyle {#1}%
	#1\ignorespaces
}
%white space separator for binary
\newcommand{\binarysep}{~}%

%
%=============================================================================
%
% Common mathematic operator definitions (often requires AMS-TeX)
%
\newcommand{\DER}{\ensuremath{\mathrm d}}       % full derivative (as in dx)
\newcommand{\PDER}{\ensuremath{\partial}}       % partial derivative
\newcommand{\GRAD}{\ensuremath{\nabla}}         % gradient
\newcommand{\PRIME}{\ensuremath{'}}             % full derivative (as in x')
\newcommand{\HP}{\ensuremath{\circ}}            % Hadamard product
\newcommand{\M}[1]{\ensuremath{\mathbf{#1}}}    % matrix
\newcommand{\V}[1]{\ensuremath{\mathbf{#1}}}    % vector
\newcommand{\RB}[1]{\left( #1 \right)}          % round brackets
\newcommand{\SB}[1]{\left[ #1 \right]}          % square brackets
\newcommand{\CB}[1]{\left\{ #1 \right\}}        % curly brackets
\newcommand{\AB}[1]{\langle #1 \rangle}         % angle brackets
\newcommand{\ABS}[1]{\left| #1 \right|}         % absolute value
\newcommand{\NORM}[1]{\left\| #1 \right\|}      % norm
\newcommand{\F}[1]{\RB{#1}}                     % function of
\newcommand{\FLOOR}[1]{\left\lfloor #1 \right\rfloor}   % floor
\newcommand{\CEIL}[1]{\left\lceil #1 \right\rceil}      % ceil
\DeclareMathOperator{\sgn}{sgn}                 % sign fn
\newcommand{\ORD}[1]{\ensuremath{O\F{#1}}}      % O(.)
\newcommand{\bdelta}{\boldsymbol{\delta}}       % bold delta
\newcommand{\ASS}{:=}                           % assignment (= or :=)

%=============================================================================
%
% Usual temporary marker
%
\newcommand{\tmp}[2]{%
  \textsf{(Remark #1: \textbf{#2})}%
  }

%=============================================================================
%
% Nios2 keywords and style definitions
% require listings and color packages
%
\definecolor{commentcolor}{rgb}{0,.5,0}
\definecolor{instrcolor}{rgb}{.5,0,0}
\definecolor{regcolor}{rgb}{0,0,0.75}
\definecolor{labelcolor}{rgb}{0.25,0.25,.25}
\definecolor{grey}{rgb}{.85,.85,.85}
%\definecolor{numericcolor}{rgb}{1,0.6,0}
\lstdefinelanguage{nios2}{
        morekeywords={% data transfert
                      ldw, stw, ldwio, stwio,
                      ldb, ldbu, ldbio, ldbuio, stb, stbio,
                      ldh, ldhu, ldhio, ldhuio, sth, sthio,
                      % logical
                      and, andi, andhi, or, ori, orhi, xor, xori, xorhi, nor,
                      % arithmetic
                      add, addi, sub, div, divu, mul, muli, mulxss, mulxuu, mulxsu,
                      % comparison
                      cmpeq, cmpne, cmpge, cmpgeu, cmplt, cmpltu,
                      cmpeqi, cmpnei, cmpgei, cmpgeui, cmplti, cmpltui,
                      % shift and rotate
                      rol, ror, roli, sll, slli, sra, srai, srl, srli,
                      % flow control
                      call, callr, ret, jmp, jmpi,
                      % branches
                      br, bge, bgeu, blt, bltu, beq, bne,
                      % others
                      trap, eret, break, bret, rdctl, wrctl,
                      flushd, flushi, initd, initi, flushp, sync,
                      % pseudoinstructions
                      bgt, bgtu, ble, bleu,
                      cmpgt, cmpgtu, cmpgti, cmpgtui, cmple, cmplei, cmpleu, cmpleui,
                      mov, movhi, movi, movia, movui,
                      nop, subi},
        otherkeywords={% assembler
                       .word, .hword, .byte, .equ},
        morekeywords=[2]{% registers
                         zero, at, a0, a1, a2, a3, v0 ,v1,
                         t0, t1, t2, t3, t4, t5, t6, t7,
                         s0, s1, s2, s3, s4, s5, s6, s7,
                         et, bt, gp, sp, fp, ea, ba, ra, 
                         r0, r1, r2, r3, r4, r5, r6, r7, 
                         r8, r9, r10, r11, r12, r13, r14, r15, 
                         r16, r17, r18, r19, r20, r21, r22, r23, 
                         r24, r25, r26, r27, r28, r29, r30, r31,
                         status, estatus, ienable, ipending, cpuid, %control registers
                         rA, rB, rC, ctlN}, % for symbolic presentation
        basicstyle={\ttfamily}, % default style
        keywordstyle={\bfseries\color{instrcolor}}, % style for instructions
        keywordstyle=[2]{\color{regcolor}}, % style for registers
        sensitive=false,% case sensitive = false
        upquote=true,% use the ' quote
        numbers=left,% line numbers to the left
        numberstyle=\sffamily\footnotesize\color{grey},% line numbers style
        frame=leftline,% a line between line numbers and code
        rulecolor=\color{grey},
        morecomment=[l][\color{commentcolor}]{;},% comment char and style definition
        % surround labels with < >
        moredelim=[is][\color{labelcolor}]{<}{>},
        }

%=============================================================================
%
% MIPS keywords and style definitions
%
\lstdefinelanguage{MIPS}{
        morekeywords={% data transfer
                      lw, sw, lbu, sb, lhu, sh,lb,
                      % logical
                      and, andi, or, ori, orhi, xor, xori, nor,
                      % arithmetic
                      add, addu, addi, addui, sub, subu, subi, mfc, lui,
                      div, divu, mfhi, mflo, mfc0, mult, multu,xmuli, mul, neg,
                      % comparison
                      slt, slti, sltu, sltiu,
                      % shift and rotate
                      sll, sllv, sra, srav, srl, srlv,
                      % flow control
                      j, jal, jr, jalr,
                      % branches
                      beq, bne, blez, bgtz, bltz, bgez, bltal, bgezal,
                      % pseudo instructions
                      blt, bgt, ble, bge, li, move, not,movsp,tlbwr,spmov,
                      % special
                      nop, rfe
                      },
        morekeywords=[2]{% registers
                         $zero, $at, $a0, $a1, $a2, $a3, $v0 ,$v1,
                         $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7,
                         $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7,
                         $t8, $t9, $k0, $k1, $gp, $sp, $fp, $ra, 
                         $0, $1, $2, $3, $4, $5, $6, $7, 
                         $8, $9, $10, $11, $12, $13, $14, $15, 
                         $16, $17, $18, $19, $20, $21, $22, $23, 
                         $24, $25, $26, $27, $28, $29, $30, $31},
        basicstyle={\ttfamily}, % default style
        keywordstyle={\bfseries\color{instrcolor}}, % style for instructions
        keywordstyle=[2]{\color{regcolor}}, % style for registers
        sensitive=false,% case sensitive = false
        upquote=true,% use the ' quote
        numbers=left,% line numbers to the left
        numberstyle=\sffamily\footnotesize\color{grey},% line numbers style
        frame=leftline,% a line between line numbers and code
        rulecolor=\color{grey},
        morecomment=[l][\color{commentcolor}]{;},% comment char and style definition
        morecomment=[l][\color{commentcolor}]{\#},% comment char and style definition
        % surround labels with < >
        moredelim=[is][\color{labelcolor}]{<}{>},
        }
%=============================================================================
%
% RISC "hypothetic" keywords and style definitions
%
\lstdefinelanguage{RISC}{
        morekeywords={% data transfert
                      ld, st,
                      % logical
                      and, andi, andhi, or, ori, orhi, xor, xori, xorhi, nor,
                      % arithmetic
                      add, addi, sub, div, divu, mul, muli, mulxss, mulxuu, mulxsu,
                      % comparison
                      cmpeq, cmpne, cmpge, cmpgeu, cmplt, cmpltu,
                      cmpeqi, cmpnei, cmpgei, cmpgeui, cmplti, cmpltui,
                      % shift and rotate
                      rol, ror, roli, sll, slli, sra, srai, srl, srli,
                      % flow control
                      call, callr, ret, jmp, jmpi,
                      % branches
                      br, bge, bgeu, blt, bltu, beq, bne,
                      % others
                      trap, eret, break, bret, rdctl, wrctl,
                      flushd, flushi, initd, initi, flushp, sync,
                      % pseudoinstructions
                      bgt, bgtu, ble, bleu,
                      cmpgt, cmpgtu, cmpgti, cmpgtui, cmple, cmplei, cmpleu, cmpleui,
                      mov, movhi, movi, movia, movui,
                      nop, subi},
        otherkeywords={% assembler
                       .word, .hword, .byte, .equ},
        morekeywords=[2]{% registers
                         zero, at, a0, a1, a2, a3, v0 ,v1,
                         t0, t1, t2, t3, t4, t5, t6, t7,
                         s0, s1, s2, s3, s4, s5, s6, s7,
                         et, bt, gp, sp, fp, ea, ba, ra, 
                         r0, r1, r2, r3, r4, r5, r6, r7, 
                         r8, r9, r10, r11, r12, r13, r14, r15, 
                         r16, r17, r18, r19, r20, r21, r22, r23, 
                         r24, r25, r26, r27, r28, r29, r30, r31,
                         rA, rB, rC}, % for symbolic presentation
        basicstyle={\ttfamily}, % default style
        keywordstyle={\bfseries\color{instrcolor}}, % style for instructions
        keywordstyle=[2]{\color{regcolor}}, % style for registers
        sensitive=false,% case sensitive = false
        upquote=true,% use the ' quote
        numbers=left,% line numbers to the left
        numberstyle=\sffamily\footnotesize\color{grey},% line numbers style
        frame=leftline,% a line between line numbers and code
        rulecolor=\color{grey},
        morecomment=[l][\color{commentcolor}]{;},% comment char and style definition
        % surround labels with < >
        moredelim=[is][\color{labelcolor}]{<}{>},
        }
%=============================================================================
%
% Macros to switch between languages 
%

% Nios2
\newcommand{\lstNios}{
	\lstset{language=nios2}}
	
% VHDL with some style definition
\newcommand{\lstVHDL}{
	\lstset{language=VHDL,
	        basicstyle={\ttfamily},% defaultstyle
	        keywordstyle={\bfseries\color{instrcolor}},% keywordstyle
	        commentstyle={\itshape\color{commentcolor}},% comment style
	        stringstyle={\color{regcolor}},% string style
	        upquote=true,% use the ' quote,
	        numbers=none,% no line number
	        frame=leftline,% a line between line numbers and code
	        rulecolor=\color{grey}
	}}

% MIPS
\newcommand{\lstMIPS}{
	\lstset{language=MIPS} \lstset{numbers=none}}

% RISC
\newcommand{\lstRISC}{
	\lstset{language=RISC} \lstset{numbers=none}}

% VHDL by default
\lstVHDL
%=============================================================================

