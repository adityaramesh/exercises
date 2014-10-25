<!--
  ** File Name:	README.md
  ** Author:	Aditya Ramesh
  ** Date:	11/29/2012
  ** Contact:	_@adityaramesh.com
-->

## Introduction

This LaTeX package is useful for typesetting problem sets for courses. A heading
can be inserted at the top of the page that includes the following information:
the problem set number, course title, and student name. Additionally, an
`Exercise` environment is provided that automatically numbers problems in the
margin, using the following format:

      Exercise {major number}.{problem number}.

For multipart exercises and solutions, an extension of the `enumerate`
environment called `Parts` is provided. The `Parts` environment initially begins
with alphabetic labeling, and alternates between alphabetic labeling and roman
numeral labeling as the level of indentation increases. Indentation for
paragraphs within the `Parts` environment is enabled. 

## Usage

The following information must be provided in order to use this class:

	\CourseTitle{How to Train Your Dragon}
	\CourseID{DRAG-UA.101-001}
	\Assignment{1}
	\author{Jane Doe}

Here is an example describing how you would typeset a sample exercise and
solution.

	\begin{Exercise}
	Explain why each of the following items should not be fed to your
	dragon.
	\begin{Parts}
	\item Rocks.
	\item Boulders.
	\item Dragons.
	\end{Parts}
	\end{Exercise}

	\begin{Solution}
	\begin{Parts}
	\item Constipation.
	\item Constipation.
	\item Constipation.
	\end{Parts}
	\end{Solution}

By default, each problem is labeled in the left margin. The content of the label
matches the following format:

	Exercise {major number}.{problem number}.

The major number is initially set to the number of the assignment. To change the
major number, use the `\SetMajorNumber{}` command; to disable it entirely,
use `\DisableMajorNumbering`. Exercises are automatically numbered
consecutively. In case you wish to set the exercise manually, the `Exercise`
environment accepts an optional parameter, used as follows.

	\begin{Exercise}[5]
	This is problem five.
	\end{Exercise}

Subsequent exercises will then be numbered based on the the parameter given to
the `Exercise` environment.

When typesetting multipart exercises (or solutions) without any introductory
text, use the `InlineParts` environment instead of the `Parts` environment. This
avoids the unnecessary line break and indentation.
