ifneq ($(SystemDrive),)
# OS is Windows, assuming original "Times New Roman" is availible
	FONT_FAMILY:=1
	QQQQ=
	RMF=del /Q
	PERCENT=%%
	LEFTPAREN:=(
	RIGHTPAREN:=)
else
# Not Windows, using "LiberationSerif" instead
	FONT_FAMILY:=2
	QQQQ='
	RMF=rm -f 
	PERCENT=%
	LEFTPAREN:=\(
	RIGHTPAREN:=\)
endif

TEXFLAGS?=-halt-on-error -file-line-error
DRAFTCODE?=$(QQQQ)\newcounter{draft}\setcounter{draft}{1}$(QQQQ)
FONTCODE?=$(QQQQ)\newcounter{fontfamily}\setcounter{fontfamily}{$(FONT_FAMILY)}\input{$(PERCENT)S}$(QQQQ)

.PHONY: synopsis dissertation preformat pdflatex talk dissertation-preformat\
dissertation-formated synopsis-preformat pdflatex-examples xcharter-examples\
pscyr-examples xelatex-examples xelatex-msfonts-examples xelatex-liberation-examples\
lualatex-examples lualatex-msfonts-examples lualatex-liberation-examples examples\
spell-check indent clean distclean release draft

all: synopsis dissertation

preformat: synopsis-preformat dissertation-preformat

dissertation:
	latexmk -pdf -pdflatex="xelatex $(TEXFLAGS) $(PERCENT)O $(FONTCODE)" dissertation

pdflatex:
	latexmk -pdf -pdflatex="pdflatex $(TEXFLAGS) $(PERCENT)O $(PERCENT)S" dissertation

synopsis:
	latexmk -pdf -pdflatex="xelatex $(TEXFLAGS) $(PERCENT)O $(FONTCODE)" synopsis

draft:	
	latexmk -pdf -pdflatex="xelatex $(TEXFLAGS) $(PERCENT)O $(DRAFTCODE) $(FONTCODE)" dissertation
	latexmk -pdf -pdflatex="xelatex $(TEXFLAGS) $(PERCENT)O $(DRAFTCODE) $(FONTCODE)" synopsis

talk:
	$(MAKE) talk -C Presentation

dissertation-preformat:
	etex -ini "&latex" mylatexformat.ltx """dissertation.tex"""
	latexmk -pdf -jobname=dissertation -silent --shell-escape dissertation.tex

dissertation-formated:
	latexmk -pdf -jobname=dissertation -silent --shell-escape dissertation.tex

synopsis-preformat:
	etex -ini "&latex" mylatexformat.ltx """synopsis.tex"""
	latexmk -pdf -jobname=synopsis -silent --shell-escape synopsis.tex

pdflatex-examples:
#
	$(eval RCFILE = nodraft_cm_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_bibtex)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_cm_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_bibtex_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_cm_latexmkrc)
	$(eval DESCR = pdflatex)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_cm_latexmkrc)
	$(eval DESCR = pdflatex_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

pscyr-examples:
#
	$(eval RCFILE = nodraft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_pscyr_bibtex)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_pscyr_bibtex_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_msfonts_latexmkrc)
	$(eval DESCR = pdflatex_pscyr)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_msfonts_latexmkrc)
	$(eval DESCR = pdflatex_pscyr_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

xcharter-examples:
#
	$(eval RCFILE = nodraft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_xcharter_bibtex)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = pdflatex_xcharter_bibtex_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_altfont2_latexmkrc)
	$(eval DESCR = pdflatex_xcharter)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_altfont2_latexmkrc)
	$(eval DESCR = pdflatex_xcharter_draft)
	latexmk -pdf -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -pdf -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -pdf -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -pdf -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

xelatex-examples:
#
	$(eval RCFILE = nodraft_cm_bibtex_latexmkrc)
	$(eval DESCR = xelatex_bibtex)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = draft_cm_bibtex_latexmkrc)
	$(eval DESCR = xelatex_bibtex_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = nodraft_cm_latexmkrc)
	$(eval DESCR = xelatex)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_cm_latexmkrc)
	$(eval DESCR = xelatex_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

xelatex-msfonts-examples:
#
	$(eval RCFILE = nodraft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = xelatex_msfonts_bibtex)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = draft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = xelatex_msfonts_bibtex_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = nodraft_msfonts_latexmkrc)
	$(eval DESCR = xelatex_msfonts)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_msfonts_latexmkrc)
	$(eval DESCR = xelatex_msfonts_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

xelatex-liberation-examples:
#
	$(eval RCFILE = nodraft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = xelatex_liberation_bibtex)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = draft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = xelatex_liberation_bibtex_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
#
	$(eval RCFILE = nodraft_altfont2_latexmkrc)
	$(eval DESCR = xelatex_liberation)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_altfont2_latexmkrc)
	$(eval DESCR = xelatex_liberation_draft)
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -xelatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).xdv
	latexmk -xelatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) synopsis_$(DESCR).xdv
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

lualatex-examples:
#
	$(eval RCFILE = nodraft_cm_bibtex_latexmkrc)
	$(eval DESCR = lualatex_bibtex)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_cm_bibtex_latexmkrc)
	$(eval DESCR = lualatex_bibtex_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_cm_latexmkrc)
	$(eval DESCR = lualatex)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_cm_latexmkrc)
	$(eval DESCR = lualatex_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

lualatex-msfonts-examples:
#
	$(eval RCFILE = nodraft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = lualatex_msfonts_bibtex)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_msfonts_bibtex_latexmkrc)
	$(eval DESCR = lualatex_msfonts_bibtex_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_msfonts_latexmkrc)
	$(eval DESCR = lualatex_msfonts)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_msfonts_latexmkrc)
	$(eval DESCR = lualatex_msfonts_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

lualatex-liberation-examples:
#
	$(eval RCFILE = nodraft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = lualatex_liberation_bibtex)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = draft_altfont2_bibtex_latexmkrc)
	$(eval DESCR = lualatex_liberation_bibtex_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
#
	$(eval RCFILE = nodraft_altfont2_latexmkrc)
	$(eval DESCR = lualatex_liberation)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml
#
	$(eval RCFILE = draft_altfont2_latexmkrc)
	$(eval DESCR = lualatex_liberation_draft)
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -r $(RCFILE) -silent -shell-escape dissertation
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -r $(RCFILE) -silent -shell-escape synopsis
	latexmk -lualatex -jobname="dissertation_$(DESCR)" -c dissertation
	$(RMF) dissertation_$(DESCR).bbl
	latexmk -lualatex -jobname="synopsis_$(DESCR)" -c synopsis
	$(RMF) synopsis_$(DESCR).bbl
	$(RMF) dissertation_$(DESCR).run.xml
	$(RMF) synopsis_$(DESCR).run.xml

examples: pdflatex-examples pscyr-examples xcharter-examples xelatex-examples\
xelatex-msfonts-examples xelatex-liberation-examples lualatex-examples\
lualatex-msfonts-examples lualatex-liberation-examples

SPELLCHECK_DIRS ?= Dissertation Presentation Synopsis
SPELLCHECK_FILES ?= $(foreach dir,$(SPELLCHECK_DIRS),$(wildcard $(dir)/*.tex))
SPELLCHECK_LANG ?= ru
DICT_DIR ?=
DICT_MAIN ?=
DICT_EXTRA ?=

ifdef DICT_DIR
    SDICT_DIR := --dict-dir=$(DICT_DIR)
endif

ifdef DICT_MAIN
    SDICT_MAIN := --master=$(DICT_MAIN)
endif

ifdef DICT_EXTRA
    SDICT_EXTRA := --extra-dicts=$(DICT_EXTRA)
endif

spell-check:
	@$(foreach file, $(SPELLCHECK_FILES),\
	aspell --lang=$(SPELLCHECK_LANG) $(SDICT_DIR) $(SDICT_MAIN) $(SDICT_EXTRA) --mode=tex --ignore-case check $(file);)

INDENT_SETTINGS ?= indent.yaml
INDENT_DIRS ?= Dissertation Presentation Synopsis
INDENT_FILES ?= $(foreach dir,$(INDENT_DIRS),$(wildcard $(dir)/*.tex))
indent:
	@$(foreach file, $(INDENT_FILES),\
	latexindent -l=$(INDENT_SETTINGS) -s -w $(file);)

clean:
	latexmk -C dissertation
	$(RMF) dissertation.bbl
	latexmk -C synopsis
	$(RMF) synopsis.bbl
	$(MAKE) clean -C Presentation

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
	

	$(RMF) *.synctex.gz$(LEFTPAREN)busy$(RIGHTPAREN)		
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
	
ifneq ($(SystemDrive),)
#  * Windows cmd does not privide "digit" wildcard
#  * findstr - based approach is too messy ( https://superuser.com/a/490023/135260 )
#  * powershell seem to be OK ( https://stackoverflow.com/a/23768332/1032586 )
	powershell -Command "Get-ChildItem | Where{$$_.Name -Match '\.(eledsec)?[1-9][0-9]{0,2}R*$$'} | Remove-Item"
else
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
endif

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
#
ifneq ($(SystemDrive),)
	powershell -Command "Get-ChildItem | Where{$$_.Name -Match '\.mtc[1-9]?[0-9]?$$'} | Remove-Item"
else
	$(RMF) *.mtc
	$(RMF) *.mtc[0-9]
	$(RMF) *.mtc[1-9][0-9]
endif
	
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
ifneq ($(SystemDrive),)
# Windows cmd `rmdir` does not accept wildcards
	powershell -Command "Remove-Item sympy-plots-for-*.tex"
else
	$(RMF) sympy-plots-for-*.tex/
endif

# pdfcomment
	$(RMF) *.upa
	$(RMF) *.upb

#pythontex
	$(RMF) *.pytxcode
ifneq ($(SystemDrive),)
	powershell -Command "Remove-Item pythontex-files-*"
else
	$(RMF) pythontex-files-*/
endif

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
ifneq ($(SystemDrive),)
	powershell -Command "Get-ChildItem | Where{$$_.Name -Match '\.bak[0-9]$$'} | Remove-Item"
else
	$(RMF) *.bak[0-9]
endif

release: all
	git add dissertation.pdf
	git add synopsis.pdf
