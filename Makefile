.PHONY: chapters

split-intransitivity-arawak.pdf: main.tex title.tex bib/references.bib bib/lsalike.bst chapters
	sed -i 's/S\\o ren/S{\\o}ren/g' bib/references.bib # fix Mendeley Bibtex output
	latexmk -xelatex main.tex
	latexmk -c
	mv main.pdf split-intransitivity-arawak.pdf

chapters: chapter1/chapter.tex chapter2/chapter.tex chapter3/chapter.tex

chapter%/chapter.tex: chapter%/chapter.mmd
	multimarkdown -t latex -b $<
