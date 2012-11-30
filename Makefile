#
# File Name:	Makefile
# Author:	Aditya Ramesh
# Date:		11/30/2012
# Contact:	_@adityaramesh.com
#

install :
	cp ps.cls $$TEXMFHOME/tex/latex

uninstall :
	rm $$TEXMFHOME/tex/latex/ps.cls
