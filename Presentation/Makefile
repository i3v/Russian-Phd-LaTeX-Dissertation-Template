
ifneq ($(SystemDrive),)
# OS is Windows, assuming original "Times New Roman" is availible
	SHELL=cmd    
    QQQQ=	
	RMF=del /Q
else
# Not Windows, using "LiberationSerif" instead    
    QQQQ='
	RMF=rm -f 
endif

all:	talk

talk:	pdf
#	latexmk -pdf -pdflatex="xelatex %O %S" presentation.tex

pdf:
	latexmk -pdf -jobname=presentation -silent  presentation.tex
# xedraft:
# 	xelatex -ini "&pdflatex draft-preamble.tex\dump"
# 	latexmk -pdf -pdflatex="xelatex %O %S" draft

clean:
	latexmk -C presentation
	$(RMF) synopsis.bbl

distclean:
## Core latex/pdflatex auxiliary files:
	$(RMF) *.aux
	$(RMF) *.lof
	$(RMF) *.log
	$(RMF) *.lot
	$(RMF) *.fls
	$(RMF) *.out
	$(RMF) *.toc

## Intermediate documents:
	$(RMF) *.dvi
	$(RMF) *-converted-to.*
# these rules might exclude image files for figures etc.
# *.ps
# *.eps
# *.pdf

## Bibliography auxiliary files (bibtex/biblatex/biber):
	$(RMF) *.bbl
	$(RMF) *.bcf
	$(RMF) *.blg


	$(RMF) *-blx.aux
	$(RMF) *-blx.bib
	$(RMF) *.brf
	$(RMF) *.run.xml

## Build tool auxiliary files:
	$(RMF) *.fdb_latexmk
	$(RMF) *.synctex
	$(RMF) *.synctex.gz
	$(RMF) *.synctex.gz\(busy\)
	$(RMF) *.pdfsync

## Auxiliary and intermediate files from other packages:

# algorithms
	$(RMF) *.alg
	$(RMF) *.loa

# achemso
	$(RMF) acs-*.bib

# amsthm
	$(RMF) *.thm

# beamer
	$(RMF) *.nav
	$(RMF) *.snm
	$(RMF) *.vrb

#(e)ledmac/(e)ledpar
	$(RMF) *.end
	$(RMF) *.[1-9]
	$(RMF) *.[1-9][0-9]
	$(RMF) *.[1-9][0-9][0-9]
	$(RMF) *.[1-9]R
	$(RMF) *.[1-9][0-9]R
	$(RMF) *.[1-9][0-9][0-9]R
	$(RMF) *.eledsec[1-9]
	$(RMF) *.eledsec[1-9]R
	$(RMF) *.eledsec[1-9][0-9]
	$(RMF) *.eledsec[1-9][0-9]R
	$(RMF) *.eledsec[1-9][0-9][0-9]
	$(RMF) *.eledsec[1-9][0-9][0-9]R

# glossaries
	$(RMF) *.acn
	$(RMF) *.acr
	$(RMF) *.glg
	$(RMF) *.glo
	$(RMF) *.gls

# gnuplottex
	$(RMF) *-gnuplottex-*

# hyperref
	$(RMF) *.brf

# knitr
	$(RMF) *-concordance.tex
	$(RMF) *.tikz
	$(RMF) *-tikzDictionary

# listings
	$(RMF) *.lol

# makeidx
	$(RMF) *.idx
	$(RMF) *.ilg
	$(RMF) *.ind
	$(RMF) *.ist

# minitoc
	$(RMF) *.maf
	$(RMF) *.mtc
	$(RMF) *.mtc[0-9]
	$(RMF) *.mtc[1-9][0-9]

# minted
	$(RMF) _minted*
	$(RMF) *.pyg

# morewrites
	$(RMF) *.mw

# mylatexformat
	$(RMF) *.fmt

# nomencl
	$(RMF) *.nlo

# sagetex
	$(RMF) *.sagetex.sage
	$(RMF) *.sagetex.py
	$(RMF) *.sagetex.scmd

# sympy
	$(RMF) *.sout
	$(RMF) *.sympy
	$(RMF) sympy-plots-for-*.tex/

# pdfcomment
	$(RMF) *.upa
	$(RMF) *.upb

#pythontex
	$(RMF) *.pytxcode
	$(RMF) pythontex-files-*/

# Texpad
	$(RMF) .texpadtmp

# TikZ & PGF
	$(RMF) *.dpth
	$(RMF) *.md5
	$(RMF) *.auxlock

# todonotes
	$(RMF) *.tdo

# xindy
	$(RMF) *.xdy

# WinEdt
	$(RMF) *.bak
	$(RMF) *.sav

# endfloat
	$(RMF) *.ttt
	$(RMF) *.fff
	$(RMF) *.aux
	$(RMF) *.bbl
	$(RMF) *.blg
	$(RMF) *.dvi
	$(RMF) *.fdb_latexmk
	$(RMF) *.fls
	$(RMF) *.glg
	$(RMF) *.glo
	$(RMF) *.gls
	$(RMF) *.idx
	$(RMF) *.ilg
	$(RMF) *.ind
	$(RMF) *.ist
	$(RMF) *.lof
	$(RMF) *.log
	$(RMF) *.lot
	$(RMF) *.nav
	$(RMF) *.nlo
	$(RMF) *.out
	$(RMF) *.pdfsync
	$(RMF) *.ps
	$(RMF) *.snm
	$(RMF) *.synctex.gz
	$(RMF) *.toc
	$(RMF) *.vrb
	$(RMF) *.maf
	$(RMF) *.mtc
	$(RMF) *.mtc0
	$(RMF) *.bak
	$(RMF) *.bcf
	$(RMF) *.run.xml

# latexindent backup
	$(RMF) *.bak[0-9]
