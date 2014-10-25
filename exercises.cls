%
% File Name:	exercises.cls
% Author:	Aditya Ramesh
% Date:		12/29/2012
% Contact:	_@adityaramesh.com
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{exercises}

\RequirePackage{enumitem}
\RequirePackage{marginnote}

\makeatletter

\newcommand\CourseTitle[1]{\renewcommand\@CourseTitle{#1}}
\newcommand\@CourseTitle{%
	\PackageError{exercises}{No course name specified}
	{Did you use the \noexpand\CourseTitle command?}
}

\newcommand\CourseID[1]{\renewcommand\@CourseID{#1}}
\newcommand\@CourseID{%
	\PackageError{exercises}{No course title specified}
	{Did you use the \noexpand\CourseID command?}
}

\newcommand\Assignment[1]{\renewcommand\@Assignment{#1}}
\newcommand\@Assignment{%
	\PackageError{exercises}{No assignment number specified}
	{Did you use the \noexpand\Assignment command?}
}

\renewcommand{\MakeAssignmentTitle}{%
	\begin{center}
	\LARGE
	\@CourseID \\
	\@CourseTitle \\
	\medskip
	\large
	\begin{tabular}{p{2in}@{\hspace{0.2in}}p{2in}}
	\raggedleft \hspace{0.05in} Assignment \@Assignment &
	\raggedright \@author \hspace{0.05in}
	\end{tabular}
	\end{center}
	\bigskip
}

\newcounter{@ExerciseCounter}
\setcounter{@ExerciseCounter}{1}
\newcommand\@MajorNumber{\@Assignment.}

\newcommand\SetMajorNumber[1]{
	\renewcommand\@MajorNumber{#1.}
	\setcounter{@ExerciseCounter}{1}
}

\newcommand\SetMinorNumber[1]{
	\setcounter{@ExerciseCounter}{#1}
}

\newcommand\DisableMajorNumbering{%
	\renewcommand\@MajorNumber{}
	\setcounter{@ExerciseCounter}{1}
}

\newenvironment{exercise}[1][]{%
	\ifx\newenvironment#1\newenvironment%
		\reversemarginpar%
		\marginnote{\textit{Exercise \@MajorNumber\arabic{@ExerciseCounter}.}}%
		\stepcounter{@ExerciseCounter}%
		\noindent%
	\else%
		\marginnote{\textit{Exercise #1.}}%
		\noindent%
	\fi%
}{\medskip}

\newenvironment{solution}{%
	\reversemarginpar%
	\marginnote{\textit{Solution.}}%
	\noindent%
	\ignorespaces%
}{\medskip}

\newlength{\@PartsLabelWidth}

\newenvironment{multiexercise}[1][]{%
	\settowidth{\@PartsLabelWidth}{(a)}%
	\ifx\newenvironment#1\newenvironment%
		\reversemarginpar%
		\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
		\item[\marginnote{\normalfont\textit{Exercise \@MajorNumber\arabic{@ExerciseCounter}.}}]%
		\stepcounter{@ExerciseCounter}%
		\begin{parts}[leftmargin=\@PartsLabelWidth, labelsep=5pt]%
	\else%
		\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
		\item[\marginnote{\textit{Exercise #1.}}%
		\begin{parts}[leftmargin=\@PartsLabelWidth, labelsep=5pt]%
	\fi%
}{%
	\end{parts}%
	\end{description}%
	\medskip%
}

\newenvironment{multisolution}{%
	\settowidth{\@PartsLabelWidth}{(a)}%
	\reversemarginpar%
	\begin{description}[leftmargin=0em, labelwidth=0pt, labelsep=0pt]%
	\item[\marginnote{\normalfont\textit{Solution.}}]%
	\begin{parts}[leftmargin=\@PartsLabelWidth, labelsep=5pt]%
}{%
	\end{parts}%
	\end{description}%
	\medskip%
}

\newlist{parts}{enumerate}{5}
\setlist[parts,1]{label=(\alph*), listparindent=\parindent}
\setlist[parts,2]{label=\roman*., listparindent=\parindent}
\setlist[parts,3]{label=(\alph*), listpartindent=\parindent}
\setlist[parts,4]{label=\roman*., listparindent=\parindent}
\setlist[parts,5]{label=(\alph*), listparindent=\parindent}

\makeatother
\endinput
