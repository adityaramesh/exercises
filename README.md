<!--
  ** File Name:	README.md
  ** Author:	Aditya Ramesh
  ** Date:	11/29/2012
  ** Contact:	_@adityaramesh.com
-->

## Introduction

This LaTeX package is useful for typesetting problem sets for courses. A heading
in be inserted at the top of the page that includes the following information:
the problem set number, course title, student name, and student email.
Additionally, a `exercise` environment is provided that automatically numbers
problems in the margin, using the following format:

      Exercise {major number}.{problem number}.

A fixed amount of vertical spacing is automatically inserted after each problem.
For problems with many steps, an extension of the `enumerate` environment called
`parts`, is provided. The `parts` environment initially begins with alphabetic
labeling, and alternates between alphabetic labeling and roman numeral labeling
as the level of indentation increases. Indentation for paragraphs within the
`parts` environment is enabled. 

## Usage

The following information must be provided in order to use this class:

	\CourseTitle{How to Train Your Dragon}
	\CourseID{DRAG-UA.101-001}
	\Assignment{1}
	\author{Jane Doe}

Here is an example describing how you would typeset a sample exercise and
solution.

	\begin{exercise}
	Explain why each of the following items should not be fed to your
	dragon.
	\begin{parts}
	\part Rocks.
	\part Boulders.
	\part Dragons.
	\end{parts}
	\end{exercise}

	\begin{solution}
	\begin{parts}
	\part Constipation.
	\part Constipation.
	\part Dear God the constipation.
	\end{parts}
	\end{solution}

By default, each problem is labeled in the left margin. The content of the label
matches the following format:

	Exercise {major number}.{problem number}.

The major number is initially set to the number of the assignment. To change the
major number, use the `\SetMajorNumber{}` command; to disable it entirely,
use `\DisableMajorNumbering`. Exercises are automatically numbered
consecutively. In case you wish to set the exercise manually, the `exercise`
environment accepts an optional parameter, used as follows.

	\begin{exercise}[5]
	This is problem five.
	\end{exercise}

Subsequent exercises will then be numbered based on the the parameter given to
the `exercise` environment.
