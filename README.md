<!--
  ** File Name:	README.md
  ** Author:	Aditya Ramesh
  ** Date:	11/29/2012
  ** Contact:	_@adityaramesh.com
-->

## Introduction

This class file, an extension of the `article` class, is used to typeset problem
sets for courses. A heading is inserted at the top of the page that includes the
following information: the problem set number, course title, student name, and
student email. Additionally, a `problem` environment is provided that
automatically numbers problems, using the following format:

      Exercise {major number}.{problem number}.

A fixed amount of vertical spacing is automatically inserted after each problem.
For problems with many steps, an extension of the `enumerate` environment called
`parts`, is provided. The `parts` environment initially begins with
alpha-labeling, and alternates between alpha-labeling and roman-labeling as the
level of indentation increases. Indentation for paragraphs within the `parts`
environment is enabled. The font is set to Crimson (designed by Sebastian Koch)
by default. Some frequently-used packages for typesetting mathematics, and
producing tables and a few other environments, are also included.

## Usage

To use this class, you must set values for the following commands, as in the
following example.

	\coursename{How to Train Your Dragon}
	\coursetitle{DRAG-UA.101-001}
	\author{Jane Doe}
	\problemset{1}

Here is an example describing how you would typeset a sample problem (and
solution).

	\begin{problem}
	Describe why you should not feed your dragon any of the following items.
	\begin{parts}
	\item Rocks.
	\item Boulders.
	\item Dragons.
	\end{parts}
	\end{problem}

	\begin{solution}
	\begin{parts}
	\item Constipation.
	\item Constipation.
	\item Constipation.
	\end{parts}
	\end{solution}

By default, each problem is prefixed by the following string.

	Exercise {major number}.{problem number}.

The major number is initially set to the number of the problem set. To change
the major number, use the `\setmajornumber{}` command; to disable it entirely,
invoke `\disablemajornumbering`. Problems are automatically numbered
consecutively. In case you wish to set the problem number manually, the
`problem` environment accepts an optional parameter, used as follows.

	\begin{problem}[5]
	This is problem five.
	\end{problem}
