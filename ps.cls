%
% File Name:	ps.cls
% Author:	Aditya Ramesh
% Date:		12/29/2012
% Contact:	_@adityaramesh.com
%
% Please consult the README.md file for usage and documentation.
%
% TODO: Make the parts environment place the outermost items flush to the left
% margin if there is no text at the beginning of the line.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ps}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}
\RequirePackage{enumitem}
\RequirePackage{marginnote}

\makeatletter

\newcommand\coursename[1]{\renewcommand\@coursename{#1}}
\newcommand\@coursename{%
	\ClassError{ps}{No course name specified.}
	{Did you use the \noexpand\coursename command?}
}

\newcommand\coursetitle[1]{\renewcommand\@coursetitle{#1}}
\newcommand\@coursetitle{%
	\ClassError{ps}{No course title specified.}
	{Did you use the \noexpand\coursetitle command?}
}

\newcommand\problemset[1]{\renewcommand\@problemset{#1}}
\newcommand\@problemset{%
	\ClassError{ps}{No problem set number specified.}
	{Did you use the \noexpand\problemset command?}
}

\renewcommand{\maketitle}{%
	\begin{center}
	\LARGE
	\@coursetitle \\
	\@coursename \\
	\medskip
	\large
	\begin{tabular}{p{2in}@{\hspace{0.2in}}p{2in}}
	\raggedleft \hspace{0.05in} Problem Set \@problemset &
	\raggedright \@author \hspace{0.05in}
	\end{tabular}
	\end{center}
	\bigskip
}

\newcounter{@problemcounter}
\setcounter{@problemcounter}{1}
\newcommand\@majornumber{\@problemset.}

\newcommand\setmajornumber[1]{
	\renewcommand\@majornumber{#1.}
	\setcounter{@problemcounter}{1}
}

\newcommand\setminornumber[1]{
	\setcounter{@problemcounter}{#1}
}

\newcommand\disablemajornumbering{%
	\renewcommand\@majornumber{}
	\setcounter{@problemcounter}{1}
}

\newenvironment{problem}[1][]{%
	\ifx\newenvironment#1\newenvironment%
		\reversemarginpar%
		\marginnote{\textit{Exercise \@majornumber\arabic{@problemcounter}.}}%
		\stepcounter{@problemcounter}%
		\noindent%
	\else%
		\marginnote{\textit{Exercise #1.}}%
		\noindent%
	\fi%
}{\medskip}

\newenvironment{solution}{%
	\reversemarginpar\marginnote{\textit{Solution.}}%
	\noindent%
}{\medskip}

\newlength{\@partslabelwidth}

\newenvironment{multiproblem}[1][]{%
	\settowidth{\@partslabelwidth}{(a)}%
	\ifx\newenvironment#1\newenvironment%
		\reversemarginpar%
		\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
		\item[\marginnote{\normalfont\textit{Exercise \@majornumber\arabic{@problemcounter}.}}]%
		\stepcounter{@problemcounter}%
		\begin{parts}[leftmargin=\@partslabelwidth, labelsep=5pt]%
	\else%
		\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
		\item[\marginnote{\textit{Exercise #1.}}%
		\begin{parts}[leftmargin=\@partslabelwidth, labelsep=5pt]%
	\fi%
}{\end{parts}\end{description}\medskip}

\newenvironment{multisolution}{%
	\settowidth{\@partslabelwidth}{(a)}%
	\reversemarginpar%
	\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
	\item[\marginnote{\normalfont\textit{Solution.}}]%
	\begin{parts}[leftmargin=\@partslabelwidth, labelsep=5pt]%
}{\end{parts}\end{description}\medskip}

\newlist{parts}{enumerate}{5}
\setlist[parts,1]{label=(\alph*), listparindent=\parindent}
\setlist[parts,2]{label=\roman*., listparindent=\parindent}
\setlist[parts,3]{label=(\alph*), listpartindent=\parindent}
\setlist[parts,4]{label=\roman*., listparindent=\parindent}
\setlist[parts,5]{label=(\alph*), listparindent=\parindent}

\makeatother
\endinput
